# NN git demo
Hi NN, welcome to the wonderful world of git!


## CenterFieldStage

# Base template to get started
- Place your export at `/apex`
- Add your Liquibase scripts in `/liquibase`
- Add your database credentials to `/liquibase/liquibase.properties`
- Tip: 

# Liquibase
## For sql
```xml
<changeSet id="FILE" author="FIRST.LASTNAME" runAlways="false" runOnChange="false">
    <sqlFile path="install/tables/FILE.sql" />
</changeSet>
```

## For pl/sql
```xml
<changeSet id="FILE" author="FIRST.LASTNAME" runAlways="false" runOnChange="false">
    <sqlFile splitStatements="false" path="install/plsql/FILE.sql" />
</changeSet>
```

## For blob files (like AOP templates)
```xml
<changeSet id="insert_template" author="FIRST.LASTNAME" runAlways="true" runOnChange="true">
    <delete tableName="templates">
        <where>TEMPLATE_NAME like 'Cronos'</where>
    </delete>
    <insert tableName="templates">
      <column name="TEMPLATE_NAME" type="varchar2(40)" value="Cronos" />
      <column name="TEMPLATE_FILE" type="BLOB" valueBlobFile="../data/templates/cronos.docx" />
</insert>
```