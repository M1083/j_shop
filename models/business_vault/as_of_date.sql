{{ config(materialized='table') }}

{%- set datepart = "hour" -%}
{%- set start_date = "TO_DATE('2024/03/23', 'yyyy/mm/dd')" -%}
{%- set end_date = "TO_DATE('2024/03/25', 'yyyy/mm/dd')" -%}

WITH as_of_date AS (
    {{ dbt_utils.date_spine(datepart=datepart, 
                            start_date=start_date,
                            end_date=end_date) }}
)

SELECT DATE_{{datepart}} as AS_OF_DATE FROM as_of_date