SELECT date, type, description, city
FROM crime_scene_report
WHERE date = 20180115 AND city = 'SQL City' AND type = 'murder'

SELECT * FROM person
WHERE address_street_name = 'Franklin Ave' AND name = 'Annabel Miller'

SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC

SELECT transcript FROM interview WHERE person_id = 14887

SELECT transcript FROM interview WHERE person_id = 16371

SELECT * FROM get_fit_now_member WHERE id LIKE '48Z%' AND membership_status = 'gold'

SELECT * FROM drivers_license WHERE plate_number LIKE '%H42W%' AND gender = 'male'

SELECT * FROM get_fit_now_check_in
WHERE check_in_date = 20180109 AND membership_id LIKE '48Z%'

SELECT * FROM get_fit_now_member
WHERE name = 'Annabel Miller'

SELECT * FROM get_fit_now_check_in
WHERE check_in_date = 20180109 AND membership_id = 90081

SELECT transcript FROM interview WHERE person_id = 67318

SELECT * FROM drivers_license
WHERE car_make = 'Tesla' AND gender = 'female' AND car_model = 'Model S'
AND hair_color = 'red'

SELECT * FROM facebook_event_checkin
WHERE date LIKE '201712%' AND event_name LIKE 'SQL%' ORDER BY person_id

SELECT * FROM person WHERE id = 99716

INSERT INTO solution VALUES (1, 'Miranda Priestly');
        SELECT value FROM solution;


-- The person who orchestrated the murder is Miranda Priestly !