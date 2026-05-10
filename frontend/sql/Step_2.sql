-- ===================================================
-- КРОК 2: Наповнення тестовими даними (DML)
-- ===================================================

USE LibraryManagement;

INSERT INTO authors (author_name) VALUES
('Джордж Орвелл'),
('Стівен Кінг');

INSERT INTO genres (genre_name) VALUES
('Антиутопія'),
('Жахи');

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('1984', 1949, 1, 1),
('Сяйво', 1977, 2, 2);

INSERT INTO users (username, email) VALUES
('oleh_h', 'oleh@example.com'),
('yuliia_h', 'yuliia@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2026-05-01', '2026-05-15'),
(2, 2, '2026-05-05', NULL);

-- Швидка перевірка, що дані успішно завантажено
SELECT * FROM books;
