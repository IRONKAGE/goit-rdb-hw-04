-- ===================================================
-- КРОК 4: Аналітика (Завдання 4, пункти 3-7)
-- ===================================================

USE goit_rdb_hw04;

SELECT
    c.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN customers cust ON o.customer_id = cust.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id
WHERE e.employee_id > 3 AND e.employee_id <= 10    -- 3. employee_id > 3 та <= 10
GROUP BY c.name                                    -- 4. Згрупувати за категорією
HAVING AVG(od.quantity) > 21                       -- 5. Середня кількість > 21
ORDER BY row_count DESC                            -- 6. Сортування за спаданням рядків
LIMIT 4 OFFSET 1;                                  -- 7. Вивести 4 рядки, пропустивши перший
