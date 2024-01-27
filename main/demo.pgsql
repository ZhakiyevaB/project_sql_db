--4 таблицы, 1 с лекарствами(название, срок, проивзодитель, серия айди)
-- 2 с пациентами(фио, срок выдачи, адресс, айди)
-- 3 рецепты (номер рецепта, учреждение, врач, айди)
-- 4 с филиалы(адрес, время работы, телефон, район, айди)

-- Таблица с лекарствами

CREATE TABLE Medicines (
    med_id INTEGER PRIMARY KEY,
    med_name TEXT NOT NULL,
    expiration_date DATE,
    manufacturer TEXT,
    batch_number TEXT,
    pharmacy_id INTEGER,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id)
);

-- Таблица с пациентами
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    issue_date DATE,
    address TEXT,
    pharmacy_id INTEGER,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id)
);

-- Таблица с рецептами
CREATE TABLE Prescriptions (
    prescription_id INTEGER PRIMARY KEY,
    prescription_number TEXT NOT NULL,
    institution TEXT,
    doctor TEXT,
    pharmacy_id INTEGER,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id)
);
-- Таблица с количеством лекарств
CREATE TABLE quantity (
    quantity_id INTEGER PRIMARY KEY,
    quan_num NUMERIC,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id),Medicines(med_id)
)

-- Таблица с филиалами аптек
CREATE TABLE Pharmacies (
    pharmacy_id INTEGER PRIMARY KEY,
    address TEXT,
    working_hours TEXT,
    phone TEXT,
    district TEXT
);

--Добавляю данные

INSERT INTO Medicines (med_id, med_name, expiration_date, manufacturer, batch_number, pharmacy_id)
VALUES 
;

INSERT INTO Patients (patient_id, full_name, issue_date, address, pharmacy_id)
VALUES 
;

INSERT INTO Prescriptions (prescription_id,  prescription_number, institution, doctor, pharmacy_id)
VALUES 
;

INSERT INTO quantity (quantity_id, quan_num)
VALUES 
;

INSERT INTO Pharmacies (pharmacy_id, address, working_hours, phone, district)
VALUES 
;

/* как они вязаны
одним первичным ключом, который находится в таблице филиалы
связать отдельно таблицу Лекарства и Кол-во, дабы при уходе одного товара, измерялись данные по айди
если хочу автоматизацию, то придется сделать так чтобы они 
сначалы были в целом связаны, допустим оодно лекарство 
ушло в адресе 1, и его остаточное кол-во будет видно 
в таблице кол-во которое связано с лекарствами таблицой */

