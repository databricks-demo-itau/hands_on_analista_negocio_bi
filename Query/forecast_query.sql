-- Query para calcular o total de fechamento de cada ticker por ano e mês

select p.ticker, year(p.date) as year, month(p.date) as month, sum(p.close) as total_close
from malcoln_dandaro.prices p
join malcoln_dandaro.portfolio pf on p.ticker = pf.ticker
group by ALL;


-- Esta consulta une as tabelas de preços e portfólio para obter o histórico de preços de fechamento
-- especificamente para a ação da NVIDIA (NVDA). Ela retorna o símbolo do ticker, data e preço de fechamento
-- para todos os registros da NVDA que existem em ambas as tabelas.
select p.ticker, p.date, p.close as total_close
from malcoln_dandaro.prices p
join malcoln_dandaro.portfolio pf on p.ticker = pf.ticker
where p.ticker = 'NVDA';


-- Esta consulta cria uma tabela temporária (base_nvda) que armazena o histórico de preços de fechamento
-- para a ação da NVIDIA (NVDA). A tabela temporária é então usada como entrada para a função AI_FORECAST,
-- que realiza a previsão de preços futuros.

WITH base_nvda (
select p.ticker, p.date, p.close as total_close
from malcoln_dandaro.prices p
join malcoln_dandaro.portfolio pf on p.ticker = pf.ticker
where p.ticker = 'NVDA'
)

SELECT * FROM AI_FORECAST(
  TABLE(base_nvda),
  horizon => current_date(),
  time_col => 'date',
  value_col => 'total_close'
)


-- Esta consulta Uma tabela chamado AI_FORECAST_NVDA, que armazena o resultado
-- da função AI_FORECAST para a ação da NVIDIA (NVDA).
-- É agendada para atualizar a previsão diariamente.

CREATE MATERIALIZED VIEW AI_FORECAST_NVDA
SCHEDULE EVERY 1 DAY
AS
WITH base_nvda (
select p.ticker, p.date, p.close as total_close
from malcoln_dandaro.prices p
join malcoln_dandaro.portfolio pf on p.ticker = pf.ticker
where p.ticker = 'NVDA'
)
SELECT * FROM AI_FORECAST(
  TABLE(base_nvda),
  horizon => current_date(),
  time_col => 'date',
  value_col => 'total_close'
)



