WITH raw_level as (
    select * from {{ source('in.c-sample_data','level') }}
)
select
	"Name" as user_name,
	"Level",
	"_timestamp" as CREATED_AT
 from raw_level