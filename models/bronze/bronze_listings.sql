
{{ config(materialized='incremental', unique_key='listing_id') }}

SELECT *
FROM {{ source('staging', 'listings') }}

{% if is_incremental() %}
    WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}

{#
-- listing_id — Unique identifier to update existing rows or inserts new ones
#}


