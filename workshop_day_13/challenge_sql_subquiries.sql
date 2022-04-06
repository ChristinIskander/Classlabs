use sakila;

# 1 How many copies of the film Hunchback Impossible exist in the inventory system?
# with join
select title, count(film_id) from inventory
inner join film
using (film_id)
where title = "Hunchback Impossible"
group by film_id

# with subquiries
select count(film_id) from inventory
where film_id in (select film_id from film
where title = "Hunchback Impossible")


# 2 List all films whose length is longer than the average of all the films.
select title, length from film
where length > (select avg(length) from film)

# 3 Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor 
where actor_id in (select actor_id from film_actor
where film_id in (select film_id from film
where title = "Alone Trip"))

# 4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
# Identify all movies categorized as family films.
select title from film
where  film_id in (select film_id from film_category
where category_id in (select category_id from category
where name = "Family"))

# 5 Get name and email from customers from Canada using subqueries. 
select first_name, last_name, email from customer
where address_id in (select address_id from address
where city_id in (select city_id from city
where country_id in (select country_id from country
where country = "Canada")))

# 5 Do the same with joins. 
select first_name, last_name, email from customer
inner join address
using (address_id)
inner join city
using (city_id)
inner join country
using (country_id)
where country="Canada"

# Optional
# 6 Which are films starred by the most prolific actor? 
# Most prolific actor is defined as the actor that has acted in the most number of films. 
select title from film
where film_id in (select film_id from film_actor
where actor_id=(select actor_id from film_actor
group by actor_id
order by count(actor_id) desc
limit 1))

# 7 Films rented by most profitable customer. 
# You can use the customer table and payment table to find the most profitable customer 
# ie the customer that has made the largest sum of payments
select title from film
where film_id in (select film_id from inventory
where inventory_id in (select inventory_id from rental
where customer_id in (select customer_id from customer
where customer_id =(