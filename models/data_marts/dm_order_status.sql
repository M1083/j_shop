{{
    config(
        enabled=True
    )
}}


with ord_st as (
select
date_trunc('week', sod.order_date) as order_week
, sod.status as status
, count(*) as order_count 
	from {{ ref('hub_order') }} ho 
	left join {{ ref('sat_order_details') }} sod on sod.order_pk = ho.order_pk 
group by
date_trunc('week', sod.order_date)
, sod.status
)
select
ord_st.order_week
, ord_st.status
, ord_st.order_count 
	from ord_st