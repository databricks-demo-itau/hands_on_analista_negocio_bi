-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Exemplos Básicos de SQL Scripting
-- MAGIC
-- MAGIC Este notebook demonstra os conceitos básicos de SQL Scripting no Databricks, incluindo estruturas de controle de fluxo e manipulação de variáveis.
-- MAGIC
-- MAGIC ## Documentação Oficial
-- MAGIC - [SQL Scripting](https://docs.databricks.com/aws/en/sql/language-manual/sql-ref-scripting)
-- MAGIC - [LOOP Statement](https://docs.databricks.com/aws/en/sql/language-manual/control-flow/loop-stmt)
-- MAGIC - [IF Statement](https://docs.databricks.com/aws/en/sql/language-manual/control-flow/if-stmt)
-- MAGIC
-- MAGIC ## Cenário de Demonstração
-- MAGIC Vamos explorar:
-- MAGIC 1. Declaração e uso de variáveis
-- MAGIC 2. Estruturas de controle IF/THEN/ELSE
-- MAGIC 3. Loops e iterações
-- MAGIC 4. Tratamento de erros básico

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 1. Configuração do Schema
-- MAGIC
-- MAGIC Primeiro, vamos configurar o schema no Unity Catalog usando o nome do usuário.

-- COMMAND ----------

-- DBTITLE 1,Configurar variável com nome do usuário
DECLARE OR REPLACE VARIABLE user_name STRING;
SET VARIABLE user_name = (select replace(split(current_user, '@')[0], '.', '_') as user_name);

-- COMMAND ----------

-- DBTITLE 1,Criar Schema
CREATE SCHEMA IF NOT EXISTS IDENTIFIER("dev_hands_on." || user_name);

-- COMMAND ----------

-- DBTITLE 1,Configurar Catalog e Schema
use catalog dev_hands_on;
use schema identifier(user_name);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 2. Exemplo de IF/THEN/ELSE
-- MAGIC
-- MAGIC Demonstração de como usar estruturas condicionais em SQL Scripting.

-- COMMAND ----------

-- DBTITLE 1,Exemplo IF/THEN/ELSE com Números
BEGIN
  DECLARE choice DOUBLE DEFAULT 3.9;
  DECLARE result STRING;
  
  IF choice < 2 THEN
    VALUES ('Número menor que 2');
  ELSEIF choice < 3 THEN
    VALUES ('Número entre 2 e 3');
  ELSEIF choice < 4 THEN
    VALUES ('Número entre 3 e 4');
  ELSE
    VALUES ('Número maior ou igual a 4');
  END IF;
END;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 3. Exemplo de LOOP
-- MAGIC
-- MAGIC Demonstração de como usar loops em SQL Scripting.

-- COMMAND ----------

-- DBTITLE 1,Exemplo de Loop - Soma de Números Ímpares
BEGIN
  DECLARE sum INT DEFAULT 0;
  DECLARE num INT DEFAULT 0;
  
  sumNumbers: LOOP
    SET num = num + 1;
    
    -- Sair do loop se número maior que 10
    IF num > 10 THEN
      LEAVE sumNumbers;
    END IF;
    
    -- Pular números pares
    IF num % 2 = 0 THEN
      ITERATE sumNumbers;
    END IF;
    
    SET sum = sum + num;
  END LOOP sumNumbers;
  
  -- Mostrar resultado
  VALUES (CONCAT('Soma dos números ímpares de 1 a 10: ', sum));
END;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 4. Exemplo de Tratamento de Erros
-- MAGIC
-- MAGIC Demonstração de como implementar tratamento de erros básico.

-- COMMAND ----------

-- DBTITLE 1,Exemplo de Tratamento de Erros
BEGIN
  DECLARE divisor INT DEFAULT 0;
  DECLARE resultado DOUBLE;
  
  -- Tratamento de erro para divisão por zero
  BEGIN
    IF divisor = 0 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Divisão por zero não é permitida';
    ELSE
      SET resultado = 100 / divisor;
      VALUES (resultado);
    END IF;
  END;
END;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 5. Exemplo de Variáveis e Escopo
-- MAGIC
-- MAGIC Demonstração de como variáveis funcionam em diferentes escopos.

-- COMMAND ----------

-- DBTITLE 1,Exemplo de Escopo de Variáveis
BEGIN
  DECLARE x INT DEFAULT 10;
  
  -- Escopo externo
  VALUES (CONCAT('Valor de x no escopo externo: ', x));
  
  BEGIN
    -- Escopo interno
    DECLARE x INT DEFAULT 20;
    VALUES (CONCAT('Valor de x no escopo interno: ', x));
  END;
  
  -- Voltando ao escopo externo
  VALUES (CONCAT('Valor de x de volta ao escopo externo: ', x));
END;
