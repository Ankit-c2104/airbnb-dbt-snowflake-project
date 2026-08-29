{{ config(materialized = 'incremental', unique_key = 'GUEST_ID') }}

SELECT
    GUEST_ID,
    REPLACE(GUEST_NAME, ' ', '_') AS GUEST_NAME,
    EMAIL,
    SIGNUP_DATE,
    COUNTRY,
    IS_VERIFIED,
    CREATED_AT

FROM {{ ref('bronze_guests') }}
