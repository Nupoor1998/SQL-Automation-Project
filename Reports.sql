
SELECT *
FROM recipient 
INNER JOIN city
ON recipient.city_id = city.city_id;

SELECT *
FROM bloodsample
INNER JOIN diseasefinder
ON bloodsample.Dr_id = diseasefinder.Dr_id;

SELECT *
FROM hospitalinfo 
INNER JOIN donor
ON hospitalinfo.city_id = donor.city_id;

SELECT *
FROM city
RIGHT JOIN donor
ON city.city_id = donor.city_id;
