create database hotel_rev_db;

use hotel_rev_db;

# date will be in date type
# revenue => float
# rest will be int if numeric
# text will be in varchar  

# create a er diagram using relationship


alter table dim_date
modify date date;

alter table dim_date
modify `mmm yy` varchar(255),
modify `week no` varchar(255),
modify day_type varchar(255);

alter table dim_date
add primary key(date);

# dim_hotels
alter table dim_hotels
modify property_id int,
modify property_name varchar(255),
modify category varchar(255),
modify city varchar(255);

alter table dim_hotels
add primary key(property_id);

# dim_rooms
alter table dim_rooms
modify room_id varchar(255),
modify room_class varchar(255);

alter table dim_rooms
add primary key(room_id);

# fact_aggregated_bookings
alter table fact_aggregated_bookings
modify property_id int,
modify check_in_date date,
modify room_category varchar(255),
modify successful_bookings int,
modify capacity int;

alter table fact_aggregated_bookings
add constraint fk_fact_aggregated_bookings_property_id
foreign key(property_id) references dim_hotels(property_id);

alter table fact_aggregated_bookings
add constraint fk_fact_aggregated_bookings_room_id
foreign key(room_category) references dim_rooms(room_id);

alter table fact_aggregated_bookings
add constraint fk_fact_aggregated_bookings_check_in_date
foreign key(check_in_date) references dim_date(date);




# fact_bookings
alter table fact_bookings
modify booking_id varchar(255),
modify property_id int,
modify booking_date date,
modify check_in_date date,
modify checkout_date date,
modify no_guests int,
modify room_category varchar(255),
modify booking_platform varchar(255),
modify ratings_given int,
modify booking_status varchar(255),
modify revenue_generated float,
modify revenue_realized float;

alter table fact_bookings
add constraint fk_fact_bookings_property_id
foreign key(property_id) references dim_hotels(property_id);

alter table fact_bookings
add constraint fk_fact_bookings_room_id
foreign key(room_category) references dim_rooms(room_id);

alter table fact_bookings
add constraint fk_fact_bookings_check_in_date
foreign key(check_in_date) references dim_date(date);