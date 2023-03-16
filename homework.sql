                               -- Question 1 --
-- Create a Stored Procedure that will insert a new film into the film table with the
-- following arguments: title, description, release_year, language_id, rental_duration,
-- rental_rate, length, replace_cost, rating
                    
SELECT *
FROM film
ORDER BY title;

CREATE OR REPLACE PROCEDURE add_film(title VARCHAR, description TEXT, release_year YEAR, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4,2), length INTEGER, replacement_cost NUMERIC(5,2), rating MPAA_RATING)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END; 
$$;

DELETE FROM film
WHERE title = 'AAA test movie';

CALL add_film('AAA test movie', 'some test description', 2006, 1, 7, 4.99, 121, 21.99, 'NC-17')



                               	  -- Question 2 --
-- Create a Stored Function that will take in a category_id and return the number of
-- films in that category
CREATE OR REPLACE FUNCTION category_id_to_film_count(cat_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE film_count INTEGER;
BEGIN
	SELECT COUNT(film_id) INTO film_count
	FROM film_category 
	WHERE category_id = cat_id
	GROUP BY category_id
	ORDER BY film_count;
	RETURN film_count;
END;
$$;

SELECT category_id_to_film_count(7) -- answer 62 films 






