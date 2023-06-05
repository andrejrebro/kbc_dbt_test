{{
    config(
        materialized = 'incremental',
        on_schema_change='fail'
    )
}}
WITH src_event AS (
    select * from {{ref("src_event")}}
)
select UUID_STRING() as event_id,
      "SOURCE_SYSTEM",
      "EVENT_DATE"
  from src_event
 where "SOURCE_SYSTEM" is not null
 {% if is_incremental() %}
   and "EVENT_DATE" >= (select max("EVENT_DATE") from {{ this }})
 {% endif %}