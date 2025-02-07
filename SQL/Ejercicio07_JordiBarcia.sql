use sakila;


# Identifica los clientes que no han realizado ningún alquiler.

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id NOT IN (SELECT customer_id FROM rental);
 
# Selecciona los títulos de películas cuya duración es mayor que la duración promedio de todas las
# películas.

select title, length from film where length > (select avg(length) from film);

# Encuentra el mayor pago realizado por cada cliente.
SELECT c.customer_id, c.first_name, c.last_name, 
       (SELECT MAX(p.amount) 
        FROM payment p 
        WHERE p.customer_id = c.customer_id) AS max_payment
FROM customer c;

# Lista todos los ítems de inventario que nunca han sido alquilados.

SELECT rental_id
FROM payment
WHERE rental_id NOT IN (SELECT rental_id FROM rental);