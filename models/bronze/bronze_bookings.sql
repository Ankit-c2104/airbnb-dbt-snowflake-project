
{{ config(materialized='incremental', unique_key='booking_id') }}

SELECT *
FROM {{ source('staging', 'bookings') }}

{% if is_incremental() %}
    WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}

{#
-- booking_id — Unique identifier to update existing rows or inserts new ones
#}


