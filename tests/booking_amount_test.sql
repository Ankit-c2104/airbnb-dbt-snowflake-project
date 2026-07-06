select 
    booking_id,
    sum(booking_amount) as total_booking_amount
    
from {{ source('staging', 'bookings') }}
where booking_amount < 0
group by booking_id