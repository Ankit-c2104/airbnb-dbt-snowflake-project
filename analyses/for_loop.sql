{% set col = ['nights_booked', 'booking_id', 'booking_amount'] %}

select 
{% for c in col %}
    {{c}}
    {% if not loop.last %}, {% endif %}
{% endfor %}
from {{ref('bronze_bookings')}}