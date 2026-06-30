select *
from {{ source('staging', 'bookings') }}