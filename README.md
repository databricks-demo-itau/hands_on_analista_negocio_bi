# Hands-on Analista de Negócios BI - Databricks

Este repositório contém o material para o hands-on de Análise de Negócios e Business Intelligence no Databricks. Durante esta sessão, você irá explorar conceitos fundamentais e práticos de BI usando a plataforma Databricks, com foco especial em funcionalidades de IA.

## Pré-requisitos

- Acesso a um workspace Databricks
- Permissões para:
  - Criar queries no DBSQL
  - Acesso ao Unity Catalog
  - Visualizar e executar notebooks
  - Utilizar funções de IA

## Configuração Inicial

### Eu estou acessando esse documento pelo GITHUB:
1. [Passo a passo de como criar Git Folder no Databricks](./Guias_UI/git_folder.md).

### Após clonar, siga pelo DATABRICKS:
1. Abra o notebook <a href="$./DBDEMOS/001_instala_dbdemos_BI.py">001_instala_dbdemos_BI</a>
2. Execute as células em sequência para:
   - Configurar seu nome de usuário
   - Instalar a biblioteca dbdemos
   - Instalar as demos necessárias

## Estrutura do Hands-on

O hands-on está dividido em duas partes principais:

### 1. <a href="$./DBDEMOS/README.md">Demonstrações Interativas (DBDEMOS)</a>
Explore os conceitos fundamentais através de demos interativas:
- <a href="$./DBDEMOS/README_SQL_AI_Functions.md">SQL AI Functions</a>
- <a href="$./DBDEMOS/README_AIBI_Portfolio.md">AI BI Portfolio Assistant</a>

Para mais detalhes sobre as demos, consulte o <a href="$./DBDEMOS/README.md">README das Demonstrações</a>.

### 2. <a href="$./Extras/README.md">Laboratórios Práticos (Extras)</a>
Pratique com exercícios hands-on:
- <a href="$./Extras/README_SQL_Scripting.md">SQL Scripting</a>
- <a href="$./Extras/README_RLS_CM.md">Row Level Security e Column Masking</a>
- <a href="$./Extras/README_Glue.md">Federação de Catálogo AWS Glue</a>

Para mais detalhes sobre os laboratórios, consulte o <a href="$./Extras/README.md">README dos Laboratórios</a>.

## Suporte

Em caso de dúvidas durante os laboratórios:
1. Consulte a documentação oficial do Databricks
2. Verifique os exemplos fornecidos em cada notebook
3. Peça ajuda ao instrutor

## Limpeza

Ao finalizar os laboratórios:
1. Delete todos os assets criados (exceto catálogo e schema)
2. Salve suas queries importantes
3. Limpe recursos computacionais utilizados pelos modelos de IA

Para mais detalhes sobre cada módulo, consulte os READMEs específicos nas pastas DBDEMOS e Extras. 