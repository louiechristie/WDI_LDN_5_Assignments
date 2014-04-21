1. Selects the names of all products that are not on sale.

	select * name from products where on_sale in not 't'

2. Selects the names of all products that cost less than £20.
	
	select name from products where price >20;

3. Selects the name and price of the most expensive product.

	select name, MAX(price) from products;

4. Selects the name and price of the second most expensive product.

	#notworking select name, MAX(price) from products where price NOT IN (select max(price)) from products;

5. Selects the name and price of the least expensive product.

	select name, MIN(price) from products;

6. Selects the names and prices of all products, ordered by price in descending order.

	select name, price from products order by products.price desc;

7. Selects the average price of all products.

	select avg(price) from products;

8. Selects the sum of the price of all products.

	select sum(price) from products;

9. Selects the sum of the price of all products whose prices is less than £20.

	select sum(price) from products where price < 20;

10. Selects the id of the user with your name.

	select name from users where name is "Scott Gammon";

11. Selects the names of all users whose names start with the letter "S".

	select name from users where name like 'S%';

12. Selects the number of users whose first names are "Jonathan". ***

	select name from users where name like ‘Jonathan’;

13. Selects the number of users who want a "Teddy Bear".

	select count(wishlists.user_id) from users join wishlists on users.id = wishlists.user_id join products on wishlists.product_id = products.id where products.name = 'Teddy Bear';

14. Selects the count of items on the wishlish of the user with your name.

	select count (users.id) FROM users JOIN wishlists ON users.id = wishlists.user_id where users.name = (‘Scott Gammon’);

15. Selects the count and name of all products on the wishlist, ordered by count in descending order.

	#does not work select count,name from wishlist order by count desc;

16. Selects the count and name of all products that are not on sale on the wishlist, ordered by count in descending order.

	 #does not work select count(*), products.name FROM products
  join wishlists on products.id = wishlists.product_id where products.on_sale is 'f' group by name order by count (*) desc; #got help with this

17. Inserts a user with the name "Jonathan Anderson" into the users table. Ensure the created_at column is set to the current time.

	insert into users (created_at, name) values (current_timestamp, 'Jonathan Anderson');

18. Selects the id of the user with the name "Jonathan Anderson"?  Ensure the created_at column is set to the current time.

	select id FROM userswhere name is 'Jonathan Anderson' 25;	

19. Inserts a wishlist entry for the user with the name "Jonathan Anderson" for the product "The Ruby Programming Language".

	#not working insert wishlists (user_id, product_id)VALUES (25,4);


20. Updates the name of the "Jonathan Anderson" user to be "Jon Anderson".

	update users set name='Jon Anderson' where name='Jonathan Anderson’;

21. Deletes the user with the name "Jon Anderson".

	delete FROM users where id=25;

22. Deletes the wishlist item for the user you just deleted.

	delete from wishlists where user_id = 25;
