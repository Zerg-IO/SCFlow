CREATE TABLE Currency (
    Currency_ID INTEGER PRIMARY KEY,
    Currency_Code TEXT NOT NULL,
    Exchange_Rate_to_Base REAL NOT NULL
);

CREATE TABLE Vendor (
    Vendor_ID INTEGER PRIMARY KEY,
    Vendor_Name TEXT NOT NULL,
    Address TEXT,
    Phone TEXT,
    Email TEXT,
    Website TEXT
);

CREATE TABLE Category (
    Category_ID INTEGER PRIMARY KEY,
    Category_Name TEXT NOT NULL,
    Description TEXT
);

CREATE TABLE SubCategory (
    SubCategory_ID INTEGER PRIMARY KEY,
    SubCategory_Name TEXT NOT NULL,
    Category_ID INTEGER,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

CREATE TABLE Storage_Methods (
    Storage_ID INTEGER PRIMARY KEY,
    Storage_Name TEXT NOT NULL,
    Storage_Type TEXT NOT NULL,
    Balance REAL NOT NULL,
    Currency_ID INTEGER,
    FOREIGN KEY (Currency_ID) REFERENCES Currency(Currency_ID)
);

CREATE TABLE Credit_Cards (
    Storage_ID INTEGER PRIMARY KEY,
    Credit_Limit REAL,
    Outstanding_Balance REAL,
    Available_Credit REAL,
    Cut_Off_Date TEXT,
    Payment_Due_Date TEXT,
    FOREIGN KEY (Storage_ID) REFERENCES Storage_Methods(Storage_ID)
);

CREATE TABLE Transaction_Type (
    Type_ID INTEGER PRIMARY KEY,
    Type TEXT NOT NULL,
    Description TEXT
);

CREATE TABLE Movements (
    Movement_ID INTEGER PRIMARY KEY,
    Vendor_ID INTEGER,
    Storage_ID INTEGER,
    Type_ID INTEGER,
    Currency_ID INTEGER,
    SubCategory_ID INTEGER,
    Movement_Date TEXT NOT NULL,
    Amount REAL NOT NULL,
    Amount_in_Base_Currency REAL NOT NULL,
    Description TEXT,
    FOREIGN KEY (Vendor_ID) REFERENCES Vendor(Vendor_ID),
    FOREIGN KEY (Storage_ID) REFERENCES Storage_Methods(Storage_ID),
    FOREIGN KEY (Type_ID) REFERENCES Transaction_Type(Type_ID),
    FOREIGN KEY (Currency_ID) REFERENCES Currency(Currency_ID),
    FOREIGN KEY (SubCategory_ID) REFERENCES SubCategory(SubCategory_ID)
);

CREATE TABLE Tags (
    Tag_ID INTEGER PRIMARY KEY,
    Tag_Name TEXT NOT NULL,
    Description TEXT
);

CREATE TABLE Movements_Tags (
    Movement_ID INTEGER,
    Tag_ID INTEGER,
    PRIMARY KEY (Movement_ID, Tag_ID),
    FOREIGN KEY (Movement_ID) REFERENCES Movements(Movement_ID),
    FOREIGN KEY (Tag_ID) REFERENCES Tags(Tag_ID)
);