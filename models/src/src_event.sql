WITH raw_event as (
    select sysdate() as "SYSDATE", sysdate() as "_timestamp" from {{ source('in.c-keboola-ex-db-oracle-4608','sysdate-dual') }}
)
select
    'ORACLE_SYSDATE_DUAL' as SOURCE_SYSTEM,
	"SYSDATE" as EVENT_DATE,
	"_timestamp" as CREATED_AT
 from raw_event