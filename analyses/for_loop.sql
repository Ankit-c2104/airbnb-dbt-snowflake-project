{% set cols = ['nights_booked', 'booking_id', 'booking_amount'] %}

select 
{% for c in cols %}
    {{c}}
    {% if not loop.last %}, {% endif %}
{% endfor %}
from {{ref('bronze_bookings')}}