{{
    config(
        materialized = 'table'
    )
}}
WITH src_user as (
    select * from {{ ref("src_user")}}
),
src_level as (
    select * from {{ ref("src_level")}}
)
select 
    u."USER_ID",
	u."USER_NAME",
    u."Sales_Market",
    u."Global_Market",
    u."CREATED_AT",
    l."Level"
FROM src_user u
LEFT JOIN src_level l
  ON l."Name"=u."Name"
