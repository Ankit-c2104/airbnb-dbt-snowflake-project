WITH payments AS (
    SELECT * FROM {{ ref('silver_payments') }}
),

hosts AS (
    SELECT * FROM {{ ref('silver_hosts') }}
),

guests AS (
    SELECT * FROM {{ ref('silver_guests') }}
)

SELECT
    payments.PAYMENT_ID,
    payments.BOOKING_ID,
    payments.HOST_ID,
    payments.GUEST_ID,
    payments.PAYMENT_DATE,
    payments.PAYMENT_TYPE,
    payments.PAYMENT_STATUS,
    payments.PAYMENT_STATUS_GROUP,
    payments.PAYMENT_AMOUNT,
    hosts.HOST_NAME,
    guests.GUEST_NAME,
    payments.CREATED_AT
FROM payments
LEFT JOIN hosts
    ON payments.HOST_ID = hosts.HOST_ID
LEFT JOIN guests
    ON payments.GUEST_ID = guests.GUEST_ID
