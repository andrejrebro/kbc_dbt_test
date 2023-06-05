WITH raw_user as (
    select * from {{ source('in.c-sample_data','user') }}
)
select
    Id as user_id,
	Name as user_name,
	Sales_Market,
    Global_Market,
	_timestamp as CREATED_AT
 from raw_user