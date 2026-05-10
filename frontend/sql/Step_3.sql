-- ===================================================
-- КРОК 3: Мега-об'єднання 8 таблиць (DQL)
-- ===================================================

-- Повертаємося до нашої основної навчальної бази з ДЗ №3
USE goit_rdb_hw04;

SELECT *
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN customers cust ON o.customer_id = cust.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id;
