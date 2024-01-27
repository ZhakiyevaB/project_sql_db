
-- просто общие данные из данно йтаблицы
--SELECT * FROM Drugs;

/* 
Запрос, в котором нужно вявить какие лкеарства за этот месяц 
выдавались по рецепту, допольнительно указывая имя клиента, имя доктора,
адресс аптеки, дату выдачи. */

/* SELECT
    Clients.ClientID,
    Clients.ClientFullName,
    Drugs.Name AS DrugName,
    Prescriptions.DoctorFullName,
    Branches.PharmacyName,
    Clients.DispenseDate
FROM Clients
JOIN Drugs ON Clients.DrugID = Drugs.DrugID
JOIN Prescriptions ON Clients.DrugID = Prescriptions.DrugID
JOIN Branches ON Drugs.DrugID = Branches.DrugID
WHERE EXTRACT(MONTH FROM Clients.DispenseDate) BETWEEN 1 AND 5 AND EXTRACT(YEAR FROM Clients.DispenseDate) = 2023;

 */

/* - Вывести все товары (уникальные названия продуктов), 
которых заказано ровно 10 единиц (конечно же, это можно решить и без подзапроса). */

/* SELECT name
FROM drugs
WHERE drugid = ANY (
    SELECT drugid
    FROM drugs
    WHERE quantity = 21
); */


/* SELECT Prescriptions.PrescriptionID, Prescriptions.DoctorFullName, Prescriptions.DrugID, Drugs.Name AS DrugName
FROM Prescriptions
JOIN Drugs ON Prescriptions.DrugID = Drugs.DrugID; */


/* -- Выбор лекарств с суммой менее 10
SELECT DrugID, Name, Batch, Quantity
FROM Drugs
WHERE Quantity < 10; */

/* --Подсчет количества транзакций для каждого лекарства:
SELECT d.DrugID, d.Name AS DrugName, COUNT(t.TransactionID) AS TransactionCount
FROM Drugs.d
LEFT JOIN Transactions t ON d.DrugID = t.DrugID
GROUP BY d.DrugID, d.Name; */

--общ.цена
/* SELECT D.DrugID, D.Name AS DrugName, P.Price
FROM Drugs D
JOIN Price P ON D.DrugID = P.DrugID;*/

/*  -- меньше 2000 
SELECT D.DrugID, D.Name AS DrugName, P.Price
FROM Drugs D
JOIN Price P ON D.DrugID = P.DrugID
WHERE P.Price < 2000; */

/* -- за определннный месяц
SELECT D.DrugID, D.Name AS DrugName, P.Price, T.TransactionDate
FROM Drugs D
JOIN Price P ON D.DrugID = P.DrugID
JOIN Transactions T ON D.DrugID = T.DrugID
WHERE EXTRACT(MONTH FROM T.TransactionDate) = 5; 
 */
--название лекарства и цена 
/* SELECT Drugs.DrugID, Drugs.name, price.price
FROM Drugs
JOIN price ON Drugs.DrugID = price.DrugID; */


-- за год больше отчет транзакции
/* SELECT EXTRACT(MONTH FROM Transactions.TransactionDate) AS Month, AVG(price.price) AS AveragePrice
FROM Transactions
JOIN Drugs ON Transactions.DrugID = Drugs.DrugID
JOIN price ON Drugs.DrugID = price.DrugID
WHERE EXTRACT(YEAR FROM Transactions.TransactionDate) = '2022'
GROUP BY EXTRACT(MONTH FROM Transactions.TransactionDate);
 */

-- кол-во рецептов прописанных за определенное кол-во времени
/* SELECT EXTRACT(MONTH FROM Transactions.TransactionDate) AS Month, Drugs.Name, COUNT(*) AS TotalSold
FROM Transactions
JOIN Drugs ON Transactions.DrugID = Drugs.DrugID
WHERE EXTRACT(YEAR FROM Transactions.TransactionDate) = '2022'
GROUP BY EXTRACT(MONTH FROM Transactions.TransactionDate), Drugs.Name;
 */

