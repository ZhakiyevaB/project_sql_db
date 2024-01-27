CREATE TABLE "Drugs"(
    "drug_id" BIGINT NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "GenericName" VARCHAR(255) NOT NULL,
    "Batch" VARCHAR(255) NOT NULL,
    "ReleaseDate" DATE NOT NULL,
    "ExpiryDate" DATE NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "PharmacyBranches" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Drugs" ADD PRIMARY KEY("drug_id");
CREATE TABLE "Prescriptions"(
    "PrescriptionID" INTEGER NOT NULL,
    "DoctorFullName" VARCHAR(255) NOT NULL,
    "DrugID" INTEGER NOT NULL,
    "PrescriptionNumberr" VARCHAR(255) NOT NULL,
    "QuantityInStock" INTEGER NOT NULL,
    "PharmacyBranches" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Prescriptions" ADD PRIMARY KEY("PrescriptionID");
ALTER TABLE
    "Prescriptions" ADD CONSTRAINT "prescriptions_drugid_unique" UNIQUE("DrugID");
CREATE TABLE "Transactions"(
    "TransactionIbigintD" INTEGER NOT NULL,
    "PharmacistName" VARCHAR(255) NOT NULL,
    "DoctorName" VARCHAR(255) NOT NULL,
    "ClientName" VARCHAR(255) NOT NULL,
    "DrugID" INTEGER NOT NULL,
    "TransactionDate" DATE NOT NULL
);
ALTER TABLE
    "Transactions" ADD PRIMARY KEY("TransactionIbigintD");
ALTER TABLE
    "Transactions" ADD CONSTRAINT "transactions_drugid_unique" UNIQUE("DrugID");
CREATE TABLE "Clients"(
    "ClientID" BIGINT NOT NULL,
    "ClientFullName" BIGINT NOT NULL,
    "DrugID" BIGINT NOT NULL,
    "DispenseDate" BIGINT NOT NULL
);
ALTER TABLE
    "Clients" ADD PRIMARY KEY("ClientID");
ALTER TABLE
    "Clients" ADD CONSTRAINT "clients_drugid_unique" UNIQUE("DrugID");
CREATE TABLE "Branches"(
    "BranchID" INTEGER NOT NULL,
    "PharmacyName" VARCHAR(255) NOT NULL,
    "Address" VARCHAR(255) NOT NULL,
    "OperatingHours" VARCHAR(255) NOT NULL,
    "PhoneNumber" VARCHAR(255) NOT NULL,
    "DrugID" INTEGER NOT NULL
);
ALTER TABLE
    "Branches" ADD PRIMARY KEY("BranchID");
ALTER TABLE
    "Branches" ADD CONSTRAINT "branches_drugid_unique" UNIQUE("DrugID");
ALTER TABLE
    "Drugs" ADD CONSTRAINT "drugs_drug_id_foreign" FOREIGN KEY("drug_id") REFERENCES "Branches"("BranchID");
ALTER TABLE
    "Transactions" ADD CONSTRAINT "transactions_clientname_foreign" FOREIGN KEY("ClientName") REFERENCES "Clients"("ClientID");
ALTER TABLE
    "Clients" ADD CONSTRAINT "clients_clientfullname_foreign" FOREIGN KEY("ClientFullName") REFERENCES "Branches"("PharmacyName");
ALTER TABLE
    "Drugs" ADD CONSTRAINT "drugs_drug_id_foreign" FOREIGN KEY("drug_id") REFERENCES "Clients"("ClientID");
ALTER TABLE
    "Drugs" ADD CONSTRAINT "drugs_drug_id_foreign" FOREIGN KEY("drug_id") REFERENCES "Transactions"("TransactionIbigintD");
ALTER TABLE
    "Prescriptions" ADD CONSTRAINT "prescriptions_drugid_foreign" FOREIGN KEY("DrugID") REFERENCES "Branches"("PharmacyName");
ALTER TABLE
    "Drugs" ADD CONSTRAINT "drugs_drug_id_foreign" FOREIGN KEY("drug_id") REFERENCES "Prescriptions"("PrescriptionID");
ALTER TABLE
    "Transactions" ADD CONSTRAINT "transactions_doctorname_foreign" FOREIGN KEY("DoctorName") REFERENCES "Prescriptions"("DoctorFullName");