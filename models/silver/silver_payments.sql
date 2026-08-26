{{ config(materialized = 'incremental', unique_key = 'PAYMENT_ID') }}

SELECT
    PAYMENT_ID,
    BOOKING_ID,
    HOST_ID,
    GUEST_ID,
    PAYMENT_DATE,
    PAYMENT_TYPE,
    PAYMENT_STATUS,
    CASE
        WHEN UPPER(PAYMENT_STATUS) = 'COMPLETED' THEN 'SUCCESS'
        WHEN UPPER(PAYMENT_STATUS) = 'FAILED' THEN 'FAILED'
        ELSE 'PENDING'
    END AS PAYMENT_STATUS_GROUP,
    PAYMENT_AMOUNT,
    CREATED_AT

FROM {{ ref('bronze_payments') }}
