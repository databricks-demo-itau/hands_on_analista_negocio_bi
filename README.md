# Hands-on Analista de Negócios BI - Databricks

Este repositório contém o material para o hands-on de Análise de Negócios e Business Intelligence no Databricks. Durante esta sessão, você irá explorar conceitos fundamentais e práticos de BI usando a plataforma Databricks.

## Pré-requisitos

- Acesso a um workspace Databricks
- Permissões para:
  - Criar queries no DBSQL
  - Acesso ao Unity Catalog
  - Visualizar e executar notebooks

## Estrutura do Hands-on

O hands-on está dividido em duas partes principais:

### 1. <a href="$./DBDEMOS/README.md">Demonstrações Interativas (DBDEMOS)</a>
Explore os conceitos fundamentais através de demos interativas:
- <a href="$./DBDEMOS/README_Queries.md">Queries Avançadas</a>

Para mais detalhes sobre as demos, consulte o <a href="$./DBDEMOS/README.md">README das Demonstrações</a>.

### 2. <a href="$./LABS/README.md">Laboratórios Práticos (LABS)</a>
Pratique com exercícios hands-on:
- <a href="$./LABS/README_SQL_Analytics.md">SQL Analytics</a>

Para mais detalhes sobre os laboratórios, consulte o <a href="$./LABS/README.md">README dos Laboratórios</a>.

## Configuração Inicial

1. Abra o notebook <a href="$./Instala_dbdemos_BI.py">Instala_dbdemos_BI</a>
2. Execute as células em sequência para:
   - Configurar seu nome de usuário
   - Instalar a biblioteca dbdemos
   - Instalar as demos necessárias

## Estrutura do Repositório

```
.
├── DBDEMOS/
│   ├── AI_Forecast_MV.dbquery.ipynb  # Notebook de previsão usando AI
│   └── _resources/                   # Recursos compartilhados
│
└── LABS/
    └── SQL_Analytics/               # Labs de análise SQL
```

## Boas Práticas

- Mantenha o catálogo e schema organizados conforme as instruções
- Documente suas queries e análises
- Siga as convenções de nomenclatura estabelecidas
- Utilize comentários explicativos em suas queries

## Suporte

Em caso de dúvidas durante os laboratórios:
1. Consulte a documentação oficial do Databricks
2. Verifique os exemplos fornecidos em cada notebook
3. Peça ajuda ao instrutor

## Limpeza

Ao finalizar os laboratórios:
1. Delete todos os assets criados (exceto catálogo e schema)
2. Salve suas queries importantes

Para mais detalhes sobre cada módulo, consulte os READMEs específicos nas pastas DBDEMOS e LABS. 