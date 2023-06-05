{{
    config(
        materialized = 'incremental',
        on_schema_change='fail'
    )
}}
WITH src_event AS (
    select * from {{ref("src_event")}}
),
random_user as (select user_id from KEBOOLA_10.WORKSPACE_5901.USER_L10 order by random() limit 1)
select UUID_STRING() as event_id,
      "SOURCE_SYSTEM",
      "EVENT_DATE",
      u.user_id as user_id
  from src_event
  join random_user u
    on 1=1
 where "SOURCE_SYSTEM" is not null
 {% if is_incremental() %}
   and "EVENT_DATE" >= (select max("EVENT_DATE") from {{ this }})
 {% endif %}