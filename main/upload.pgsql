Создание базы данных
CREATE DATABASE PharmacyDatabase; 

-- Таблица с информацией о лекарствах
CREATE TABLE Drugs (
    DrugID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    GenericName VARCHAR(255) NOT NULL,
    Batch VARCHAR(50) NOT NULL,
    ReleaseDate DATE,
    ExpiryDate DATE,
    Quantity INT,
    PharmacyBranches VARCHAR(255) NOT NULL
); 

-- Таблица с информацией о рецептах
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    DoctorFullName VARCHAR(255) NOT NULL,
    DrugID INT, 
    PrescriptionNumber VARCHAR(50) NOT NULL,
    QuantityInStock INT,
    PharmacyBranches VARCHAR(255) NOT NULL,
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
); 

-- Таблица с информацией о филиалах
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    PharmacyName VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    OperatingHours VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    DrugID INT,  
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
); 

-- Таблица с информацией о транзакциях
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    PharmacistName VARCHAR(255) NOT NULL,
    DoctorName VARCHAR(255) NOT NULL,
    ClientName VARCHAR(255) NOT NULL,
    DrugID INT,  
    TransactionDate DATE,
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
); 

-- Таблица с информацией о клиентах
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    ClientFullName VARCHAR(255) NOT NULL,
    DrugID INT, 
    DispenseDate DATE,
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
); 

-- Таблица с цена
CREATE TABLE price (
    priceID INT PRIMARY KEY,
    price DECIMAL(10,2) NOT NULL,
    DrugID INT,  
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
); 

тут почти как с магазином но тут я хотела сделать связь между больницой, точнее врачом и внутрибольничной аптекой
впринципе сейчас аптеки могут быть и вне больниц, главное иметь адресс где есть аптека с помощью которой вы можете забрать лекарство
моя идея была в том чтобы врач записываал лекарство и вносил его в базу общую, там она фиксируется и показывается в какой аптеке есть это лекарство
у меня связь одно ко многим ибо одно лекарство может быть в нескольких филиалах, после чего врач может указат адресс определнной для пациента, он
туда идет и дает рецепт, фармацевт записывает в базу что тот принял рецепт и отдал рецептурный препарат, гдеесть фио клиента тоже, чтобы точно знать сколько раз в меясц он покупает лс
и таким образом чтобы клиент не искал где есть где нет тут срау видно и в больнице вы будете сразу знать что куда идти и даже по каким ценам.
я внесла общую базу и операции которые смогу проводить ради этого. Допустим месячный отчет, отчет по лекарствам в запасах. 
Хотелось бы это довести до автоматизации
У меня должны быть внутренние базы данных про их пациентов и больницы, которых нет, поэтому пока не существуюзие данные. abbrev
У нас есть сайты которые могут указать адреса где есть лекарство это айтека
и есть сайт для фармацевт которые у себя знают какие лс есть
а у врачей нет дела грубо говоря где вы будете искать лс, максимум это для тех кто в учете предостовляют 
Я хотела это объединить в одну общую базу данных в будущем, чтобы связь доктор-фармацевт-клиент была более устойчивой. 

