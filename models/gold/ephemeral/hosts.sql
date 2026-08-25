{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH hosts AS
(
    SELECT
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT
    FROM
        {{ ref('obt') }}
    QUALIFY ROW_NUMBER() OVER (PARTITION BY HOST_ID ORDER BY HOST_CREATED_AT DESC) = 1
)
SELECT * FROM hosts