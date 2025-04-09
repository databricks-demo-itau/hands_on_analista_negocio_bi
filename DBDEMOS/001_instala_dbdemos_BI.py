# Databricks notebook source
user_name = dbutils.notebook.entry_point.getDbutils().notebook().getContext().userName()
user_name = user_name.toString().split('@')[0].split('(')[1].replace('.', '_').replace("+","_").replace("-","_")


# COMMAND ----------

# MAGIC %pip install dbdemos

# COMMAND ----------

import dbdemos
dbdemos.install('aibi-portfolio-assistant', catalog='dev_hands_on', schema=user_name, create_schema=True)

# COMMAND ----------

dbdemos.install('sql-ai-functions', catalog='dev_hands_on', schema=user_name, create_schema=True)
