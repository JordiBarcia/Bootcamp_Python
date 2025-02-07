use sakila;

# Reto 6:
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_nombre, 
       COUNT(f.film_id) AS cantidad_peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.rating >= 4 
GROUP BY actor_nombre
HAVING COUNT(f.film_id) >= 20
ORDER BY cantidad_peliculas DESC;


# Reto 2:
# addres --> city_id / city_id --> city
select count(c.customer_id) as num_personas 
from customer as c
join address as a on c.address_id = a.address_id
join city as ci on a.city_id = ci.city_id
join rental as r on c.customer_id = r.customer_id
where ci.city = 'Moskow' and
r.rental_date between '2005-01-01' and '2005-12-31'; 

# Reto 4
select concat(c.first_name, ' ', c.last_name) as customer_name, f.title, r.rental_date
from customer as c
join rental as r on c.customer_id = r.customer_id
join inventory as i on i.inventory_id = r.inventory_id
join film as f on f.film_id = i.film_id
order by r.rental_date desc
Limit 5;

# Reto 8
SELECT s.first_name, s.last_name, COUNT(r.rental_id) AS total_ventas
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY total_ventas DESC
LIMIT 1;

