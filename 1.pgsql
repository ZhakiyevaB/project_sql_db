--1) Выведите все имена авторов из таблицы Authors.
/* SELECT author_name FROM Authors */
--2) Покажите названия всех книг и соответствующих им авторов.
--3) Найдите все книги в жанре "Фэнтези" из таблицы Genres.
/* SELECT Books.book_title, COUNT(Genres.genre_id) AS genre_count
FROM Genres
INNER JOIN Books ON Genres.book_id = Books.book_id
WHERE Genres.genre_name = 'Fantasy'
GROUP BY Books.book_title
ORDER BY genre_count DESC */
/* SELECT category_name, COUNT(product_id)
FROM products
INNER JOIN  categories ON  products.category_id = categories.category_id
GROUP BY category_name
ORDER BY COUNT(product_id) DESC; */
--4) Выведите имена всех читателей из таблицы Readers.
/* SELECT reader_id, reader_name FROM Readers */
--5) Покажите все книги, которые прочитал читатель с именем "Alice Johnson".
/* SELECT Books.book_title
FROM Books
JOIN ReaderBooks ON Books.book_id = ReaderBooks.book_id
JOIN Readers ON ReaderBooks.reader_id = Readers.reader_id
WHERE Readers.reader_name = 'Alice Johnson'; */

--6) Найдите всех авторов, написавших хотя бы две книги.
/* SELECT Authors.author_name
FROM Authors
JOIN Books ON Authors.author_id = Books.author_id
GROUP BY Authors.author_id
HAVING COUNT(Books.book_id) >= 2; */

--7) Выведите жанры всех книг с их количеством в базе данных.
/* SELECT Genres.genre_name, COUNT(BookGenres.book_id) AS book_count
FROM Genres
LEFT JOIN BookGenres ON Genres.genre_id = BookGenres.genre_id
GROUP BY Genres.genre_id, Genres.genre_name;
 */
--8) Покажите все книги, написанные автором с именем "Jane Doe".
/* SELECT Books.book_title, Authors.author_name
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id
WHERE Authors.author_name = 'Jane Doe'; */

--9) Найдите читателя, который прочитал наибольшее количество книг.
/* SELECT Readers.reader_name, COUNT(ReaderBooks.book_id) AS book_count
FROM Readers
JOIN ReaderBooks ON Readers.reader_id = ReaderBooks.reader_id
GROUP BY Readers.reader_id, Readers.reader_name
ORDER BY book_count DESC
LIMIT 1; */
--10) Выведите имена авторов и количество книг, написанных каждым из них.
/* SELECT Authors.author_name, COUNT(Books.book_id) AS book_count
FROM Authors
LEFT JOIN Books ON Authors.author_id = Books.author_id
GROUP BY Authors.author_id, Authors.author_name; */

--11) Найдите все книги в жанре "Научная фантастика", написанные автором с именем "Michael Johnson".
--12) Покажите все книги, которые не были прочитаны ни одним читателем.
/* SELECT Books.book_title, Authors.author_name
FROM Books
LEFT JOIN ReaderBooks ON Books.book_id = ReaderBooks.book_id
JOIN Authors ON Books.author_id = Authors.author_id
WHERE ReaderBooks.reader_id IS NULL; */

--13) Выведите читателей, которые прочитали книги в жанре "Мистика".
/* SELECT DISTINCT Readers.reader_name
FROM Readers
JOIN ReaderBooks ON Readers.reader_id = ReaderBooks.reader_id
JOIN Books ON ReaderBooks.book_id = Books.book_id
JOIN BookGenres ON Books.book_id = BookGenres.book_id
JOIN Genres ON BookGenres.genre_id = Genres.genre_id
WHERE Genres.genre_name = 'Mystery'; */

--14) Найдите все книги, написанные автором с именем "Daniel Miller" и прочитанные читателем с именем "Bob Smith".
/* SELECT Books.book_title, Authors.author_name, Readers.reader_name
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id
JOIN ReaderBooks ON Books.book_id = ReaderBooks.book_id
JOIN Readers ON ReaderBooks.reader_id = Readers.reader_id
WHERE Authors.author_name = 'Daniel Miller' AND Readers.reader_name = 'Bob Smith';
 */
--15) Покажите читателя, который прочитал наименьшее количество книг.
/* SELECT Readers.reader_name, COUNT(ReaderBooks.book_id) AS book_count
FROM Readers
LEFT JOIN ReaderBooks ON Readers.reader_id = ReaderBooks.reader_id
GROUP BY Readers.reader_id, Readers.reader_name
ORDER BY book_count ASC
LIMIT 1; */
