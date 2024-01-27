--1) Выведите все жанры книг, которые прочитал читатель с именем "Grace Taylor".
/* SELECT DISTINCT Genres.genre_name
FROM Genres
INNER JOIN BookGenres ON Genres.genre_id = BookGenres.genre_id
INNER JOIN Books ON BookGenres.book_id = Books.book_id
INNER JOIN ReaderBooks ON Books.book_id = ReaderBooks.book_id
INNER JOIN Readers ON ReaderBooks.reader_id = Readers.reader_id
WHERE Readers.reader_name = 'Grace Taylor';
*/

--2) Найдите авторов, написавших книги в жанре "Фантастика".
/* SELECT DISTINCT Authors.author_name
FROM Authors
INNER JOIN Books ON Authors.author_id = Books.author_id
INNER JOIN BookGenres ON Books.book_id = BookGenres.book_id
INNER JOIN Genres ON BookGenres.genre_id = Genres.genre_id
WHERE Genres.genre_name = 'Fantasy'; */

--3) Покажите книги, написанные авторами с именами "John Smith" и "Jane Doe".
/* SELECT Books.book_title, Authors.author_name
FROM Books
INNER JOIN Authors ON Books.author_id = Authors.author_id
WHERE Authors.author_name IN ('John Smith', 'Jane Doe'); */

--4) Выведите все книги, у которых нет жанра.
/* SELECT Books.book_title
FROM Books
LEFT JOIN BookGenres ON Books.book_id = BookGenres.book_id
WHERE BookGenres.book_id IS NULL;
 */

--5) Найдите читателей, которые прочитали книги хотя бы в двух разных жанрах.
/* SELECT Readers.reader_name
FROM Readers
INNER JOIN ReaderBooks ON Readers.reader_id = ReaderBooks.reader_id
INNER JOIN Books ON ReaderBooks.book_id = Books.book_id
INNER JOIN BookGenres ON Books.book_id = BookGenres.book_id
GROUP BY Readers.reader_id, Readers.reader_name
HAVING COUNT(DISTINCT BookGenres.genre_id) >= 2; */

--6) Покажите авторов, чьи книги не были прочитаны.
/* SELECT Authors.author_name
FROM Authors
LEFT JOIN Books ON Authors.author_id = Books.author_id
LEFT JOIN ReaderBooks ON Books.book_id = ReaderBooks.book_id
WHERE ReaderBooks.reader_id IS NULL; */


--7) Выведите читателей, прочитавших книги только в жанре "Фэнтези".
/* SELECT Readers.reader_name
FROM Readers
INNER JOIN ReaderBooks ON Readers.reader_id = ReaderBooks.reader_id
INNER JOIN Books ON ReaderBooks.book_id = Books.book_id
INNER JOIN BookGenres ON Books.book_id = BookGenres.book_id
INNER JOIN Genres ON BookGenres.genre_id = Genres.genre_id
WHERE Genres.genre_name = 'Фэнтези'
GROUP BY Readers.reader_id, Readers.reader_name
HAVING COUNT(DISTINCT Genres.genre_id) = 1;*/

--8) Найдите автора с наибольшим количеством книг в жанре "Детектив".
/* SELECT Authors.author_name, COUNT(Books.book_id) AS book_count
FROM Authors
INNER JOIN Books ON Authors.author_id = Books.author_id
INNER JOIN BookGenres ON Books.book_id = BookGenres.book_id
INNER JOIN Genres ON BookGenres.genre_id = Genres.genre_id
WHERE Genres.genre_name = 'Детектив'
GROUP BY Authors.author_id, Authors.author_name
ORDER BY book_count DESC
LIMIT 1;; */

--9) Покажите все книги, написанные в жанре "Научная фантастика", которые еще не прочитаны.
/* SELECT Books.book_title
FROM Books
INNER JOIN BookGenres ON Books.book_id = BookGenres.book_id
INNER JOIN Genres ON BookGenres.genre_id = Genres.genre_id
LEFT JOIN ReaderBooks ON Books.book_id = ReaderBooks.book_id
WHERE Genres.genre_name = 'Science Fiction' AND ReaderBooks.reader_id IS NULL;

 */
--10) Выведите все книги, которые прочитаны более чем одним читателем.
/* SELECT Books.book_title
FROM Books
INNER JOIN ReaderBooks ON Books.book_id = ReaderBooks.book_id
GROUP BY Books.book_id, Books.book_title
HAVING COUNT(ReaderBooks.reader_id) > 1; */
