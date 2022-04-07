use sakila;

# 1 Which actor has appeared in the most films?
select actor_id, first_name, last_name, count(film_id) from actor as ac
inner join film_actor as f 
using (actor_id)
group by actor_id
order by count(film_id) desc
limit 1

# 2 Most active customer (the customer that has rented the most number of films)
select count(customer_id), customer_id from rental
group by customer_id
order by count(customer_id) desc
limit 10

# 3 List number of films per category.
select count(name), name from category as c
inner join film_category as fc
on c.category_id=fc.category_id
group by name
order by count(name) desc

#4 Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff as st
inner join address as ad
using (address_id)

# 5 Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, sum(amount) from staff as st
inner join payment as pay
using (staff_id)
where payment_date between '2005-08-01' and '2005-08-31'
group by staff_id

# 6 List each film and the number of actors who are listed for that film.
select title, count(actor_id) from film
inner join film_actor
using (film_id)
group by title

# 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
#   List the customers alphabetically by last name.
select last_name, sum(amount) from payment
inner join customer
using (customer_id)
group by customer_id
order by last_name asc

