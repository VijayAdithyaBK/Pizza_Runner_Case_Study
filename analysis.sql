/* --------------------
   Case Study Questions
   --------------------*/

SELECT * FROM pizza_runner.customer_orders;
SELECT * FROM pizza_runner.pizza_names;
SELECT * FROM pizza_runner.pizza_recipes;
SELECT * FROM pizza_runner.pizza_toppings;
SELECT * FROM pizza_runner.runner_orders;
SELECT * FROM pizza_runner.runners;

-- A. Pizza Metrics
--     1. How many pizzas were ordered?
SELECT
COUNT(*) AS total_pizzas_ordered
FROM pizza_runner.customer_orders;

--     2. How many unique customer orders were made?
SELECT
COUNT(DISTINCT order_id) AS unique_customers_orders
FROM pizza_runner.customer_orders;

--     3. How many successful orders were delivered by each runner?
SELECT
runner_id,
COUNT(order_id) as delivered_orders
FROM pizza_runner.runner_orders
WHERE pickup_time <> 'null'
GROUP BY 1;

--     4. How many of each type of pizza was delivered?
SELECT
pn.pizza_name,
COUNT(co.pizza_id) AS pizzas_delivered
FROM pizza_runner.runner_orders ro
INNER JOIN pizza_runner.customer_orders co ON co.order_id = ro.order_id
INNER JOIN pizza_runner.pizza_names pn ON pn.pizza_id = co.pizza_id
WHERE ro.pickup_time <> 'null'
GROUP BY 1;

--     5. How many Vegetarian and Meatlovers were ordered by each customer?
SELECT
co.customer_id,
pn.pizza_name,
COUNT(pn.pizza_id) AS pizzas_ordered
FROM pizza_runner.customer_orders co
INNER JOIN pizza_runner.pizza_names pn ON pn.pizza_id = co.pizza_id
GROUP BY 1, 2
ORDER BY 1;

--     6. What was the maximum number of pizzas delivered in a single order?
SELECT
co.order_id,
COUNT(co.pizza_id) AS maximum_pizzas_delivered
FROM pizza_runner.customer_orders co
INNER JOIN pizza_runner.runner_orders ro ON co.order_id = ro.order_id
WHERE ro.pickup_time <> 'null'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--     7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT
co.customer_id,
SUM(CASE
    WHEN (
        (co.exclusions IS NOT NULL AND co.exclusions <> 'null' AND LENGTH(co.exclusions) > 0)
        OR (co.extras IS NOT NULL AND co.extras <> 'null' AND LENGTH(co.extras) > 0)
    ) = TRUE THEN 1
    ELSE 0
END) AS changes,
SUM(CASE
    WHEN (
        (co.exclusions IS NOT NULL AND co.exclusions <> 'null' AND LENGTH(co.exclusions) > 0)
        OR (co.extras IS NOT NULL AND co.extras <> 'null' AND LENGTH(co.extras) > 0)
    ) = TRUE THEN 0
    ELSE 1
END) AS no_changes
FROM pizza_runner.customer_orders co
INNER JOIN pizza_runner.runner_orders ro ON ro.order_id = co.order_id
WHERE ro.pickup_time <> 'null'
GROUP BY 1
ORDER BY 1;

--     8. How many pizzas were delivered that had both exclusions and extras?
SELECT
COUNT(co.pizza_id) AS pizzas_delivered_with_exclusions_and_extras
FROM
pizza_runner.customer_orders co
INNER JOIN pizza_runner.runner_orders ro ON co.order_id = ro.order_id
WHERE ro.pickup_time <> 'null'
AND ((co.exclusions IS NOT NULL AND co.exclusions <> 'null' AND LENGTH(co.exclusions) > 0)
AND (co.extras IS NOT NULL AND co.extras <> 'null' AND LENGTH(co.extras) > 0)) IS TRUE;

--     9. What was the total volume of pizzas ordered for each hour of the day?
SELECT
DATE_PART('hour', order_time) AS hour,
COUNT(pizza_id) AS pizzas_ordered
FROM pizza_runner.customer_orders
GROUP BY 1
ORDER BY 1;

--     10. What was the volume of orders for each day of the week?
SELECT
DATE_PART('dow', order_time) AS day,
COUNT(pizza_id) AS pizzas_ordered
FROM pizza_runner.customer_orders
GROUP BY 1
ORDER BY 1;


-- B. Runner and Customer Experience
--     1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
--     2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
--     3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
--     4. What was the average distance travelled for each customer?
--     5. What was the difference between the longest and shortest delivery times for all orders?
--     6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
--     7. What is the successful delivery percentage for each runner?


-- C. Ingredient Optimisation
--     1. What are the standard ingredients for each pizza?
--     2. What was the most commonly added extra?
--     3. What was the most common exclusion?
--     4. Generate an order item for each record in the customers_orders table in the format of one of the following:
--         Meat Lovers
--         Meat Lovers - Exclude Beef
--         Meat Lovers - Extra Bacon
--         Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
--     5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
--         For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
--     6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?


-- D. Pricing and Ratings
--     1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?
--     2. What if there was an additional $1 charge for any pizza extras?
--         Add cheese is $1 extra
--     3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.
--     4. Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?
--         customer_id
--         order_id
--         runner_id
--         rating
--         order_time
--         pickup_time
--         Time between order and pickup
--         Delivery duration
--         Average speed
--         Total number of pizzas
--     5. If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?


-- E. Bonus Questions
--     1. If Danny wants to expand his range of pizzas - how would this impact the existing data design? Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu?