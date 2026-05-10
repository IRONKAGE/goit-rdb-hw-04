-- =====================================================
-- КРОК 5: Аналіз JOIN та COUNT (Завдання 4, пункти 1-2)
-- =====================================================

USE goit_rdb_hw04;

-- 4.1. Скільки рядків ми отримуємо за допомогою INNER JOIN (Тільки 100% збіги):
SELECT COUNT(*) AS total_rows_inner
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN customers cust ON o.customer_id = cust.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id;

-- 4.2. Скільки рядків отримуємо, змінивши декілька на LEFT JOIN (Всі записи зліва):
SELECT COUNT(*) AS total_rows_left
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.id
LEFT JOIN products p ON od.product_id = p.id
LEFT JOIN categories c ON p.category_id = c.id
INNER JOIN customers cust ON o.customer_id = cust.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id;

-- 4.3. Скільки рядків отримуємо, змінивши декілька на RIGHT JOIN (Всі записи справа):
SELECT COUNT(*) AS total_rows_right
FROM order_details od
RIGHT JOIN orders o ON od.order_id = o.id
RIGHT JOIN products p ON od.product_id = p.id
RIGHT JOIN categories c ON p.category_id = c.id
INNER JOIN customers cust ON o.customer_id = cust.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id;

-- ======================================================
-- ДОДАТКОВИЙ ТЕСТ: Як насправді змінити кількість рядків
-- Демонстрація збереження NULL-значень через LEFT JOIN
-- ======================================================

SELECT COUNT(*) AS total_rows_with_empty_customers
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
-- 👇 Робимо RIGHT JOIN, щоб додати 17 клієнтів, які нічого не купували
RIGHT JOIN customers cust ON o.customer_id = cust.id
-- 👇 Всі наступні з'єднання ПОВИННІ бути LEFT JOIN,
-- інакше вони відкинуть цих 17 клієнтів через відсутність employee_id та shipper_id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers s ON o.shipper_id = s.id
LEFT JOIN suppliers sup ON p.supplier_id = sup.id;
