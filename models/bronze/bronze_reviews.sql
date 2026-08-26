
{{ config(materialized='incremental') }}

SELECT *
FROM {{ source('staging', 'REVIEWS') }}

{% if is_incremental() %}
    WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}

{#
-- review_id — Unique identifier to update existing rows or inserts new ones
#}

