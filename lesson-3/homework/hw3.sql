create database "lesson 3"

use "lesson 3"

----------------------------------------Easy-Level Tasks (10)------------------------------------

-- 1. Define and explain the purpose of BULK INSERT in SQL Server.
BULK INSERT - tashqi fayldan (odatda katta hajmli) ma’lumotlarni tezkor tarzda to‘g‘ridan-to‘g‘ri jadvalga yuklash uchun ishlatiladigan T-SQL operator.

Maqsadlari:
-Katta hajmdagi CSV/TXT fayllarni jadvalga tez yuklash
-ETL jarayonlarini soddalashtirish (logistika, audit, arxiv ma’lumotlarni olib kirish)
-Tarmoq va diskdan samarali foydalanish (batched, minimal logging sharoitida)

Minimal misol:
BULK INSERT dbo.Products
FROM 'C:\Data\products.csv'
WITH (
    FIRSTROW = 2, -- 1-satr sarlavha bo‘lsa
    FIELDTERMINATOR = ',', -- maydon ajratgich
    ROWTERMINATOR   = '\n', -- qator ajratgich
    TABLOCK -- tezroq yuklash uchun
);

-- 2. List four file formats that can be imported into SQL Server.
	1. CSV (Vergul bilan ajratilgan matn)
	CSV (Comma-Separated Values) — ma`lumotlar vergul bilan ajratilgan soddalashtirilgan matn formatidir. Ko`pincha ma`lumotlarni boshqa tizimlar yoki elektron jadvallar (masalan, Excel) bilan eksport qilishda ishlatiladi.
	Import qilish usuli:
	BULK INSERT: Bu metod katta hajmdagi CSV fayllarni tezda jadvalga import qilish uchun ishlatiladi.
	OPENROWSET: BULK yoki BULK INSERTdan foydalanmasdan, OPENROWSET yordamida ma`lumotlarni fayldan SQL Serverga yuklash mumkin.

	Afzalliklari:
	Oson va keng qo‘llaniladi.
	Faqat matn formatida bo‘lgan ma’lumotlar uchun yaxshi ishlaydi.
	Cheklovlari:
	Maydonlar orasidagi ajratgichni aniq bilish kerak (odatda vergul, lekin boshqalar ham bo‘lishi mumkin).
	Ma`lumotlar turini aniqlashda ba`zi qiyinchiliklar bo`lishi mumkin.

2. TXT (Delimiterli matn)

	TXT — bu oddiy matnli fayl bo‘lib, ma’lumotlar orasidagi ajratgichlar har qanday belgi bo‘lishi mumkin, masalan: tab, nuqta-vergul, probellar va boshqalar.
	Import qilish usuli:
	BULK INSERT va OPENROWSET yordamida TXT faylini import qilish mumkin, faqat ajratgichni aniq belgilash kerak.

	Afzalliklari:
	Har xil formatda bo‘lgan ma’lumotlar bilan ishlash mumkin.
	Kengaytirilgan formatlar bilan ishlash imkoniyati mavjud (masalan, tab yoki nuqta-vergul).
	Cheklovlari:
	Faylni to`g`ri formatda yaratish zarur (maydon ajratgichlarini aniq belgilash).

3. JSON (JavaScript Object Notation)
	JSON — ma`lumotlarni saqlash va uzatish uchun ishlatiladigan eng mashhur formatlardan biri bo‘lib, asosan strukturaviy ma`lumotlar uchun ishlatiladi. JSON fayllarida ma`lumotlar kalit-qiymat juftliklaridan tashkil topgan bo‘ladi.
	Import qilish usuli:
	OPENROWSET yoki SQL Server Integration Services (SSIS) yordamida JSON fayllarni import qilish mumkin.
	SQL Server 2016 va undan keyingi versiyalarda JSON fayllarni o`qish uchun FOR JSON va OPENJSON funksiyalari qo`llaniladi.

	Afzalliklari:
	Ma`lumotlar kengaytirilgan formatda va ierarxik tuzilishga ega.
	Oson tahlil qilish va ko‘p darajali ma’lumotlar bilan ishlash imkonini beradi.
	Cheklovlari:
	Katta hajmdagi JSON fayllarni ishlashda qiyinchiliklar bo‘lishi mumkin (kengaytirilgan struktura).

4. XML (Extensible Markup Language)
	XML — bu strukturaviy ma’lumotlarni saqlash formati bo‘lib, taglar orqali ma`lumotlar tashkil etiladi. XML fayllari odatda murakkab ma`lumotlarni ifodalash uchun ishlatiladi.
	Import qilish usuli:
	OPENROWSET yoki SSIS yordamida XML fayllarni import qilish mumkin.
	SQL Server`da XML fayllarni import qilishda XML ma`lumotlarni o`qish va tahlil qilish uchun XQuery yoki FOR XML funksiyalari ishlatiladi.
	Afzalliklari:
	XML kengaytirilgan va murakkab ma`lumotlarni saqlash uchun juda qulay.
	Tuzilmani saqlab qoladi, shuning uchun ierarxik va tarmoqli ma`lumotlar uchun ishlatiladi.
	Cheklovlari:
	Katta XML fayllari bilan ishlashda sekin ishlash va ko`p resurslar sarflash mumkin.

5. Excel (XLS/XLSX) va boshqa formatlar
Excel fayllarini SQL Serverga import qilish uchun SQL Server Integration Services (SSIS) ishlatiladi. PolyBase va OPENROWSET yordamida Excel va boshqa turdagi fayllarni SQL Serverga import qilish mumkin.

-- 3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
	Create table Products (ProductID int primary key, ProductName varchar(50), Price decimal (10,2));
	GO

-- 4. Insert three records into the Products table using INSERT INTO.
	select * from Products

	Insert into Products (ProductID, ProductName, Price) values
	(1, 'Apple', 40), (2, 'Peach', 50), (3, 'Banana', 25);

-- 5. Explain the difference between NULL and NOT NULL.
		NULL — qiymat noma’lum/yo‘q ekanini bildiradi (bo‘sh satr yoki 0 emas).
		NOT NULL — ustunda albatta qiymat bo‘lishi shart; NULL kiritib bo‘lmaydi.

-- 6. Add a UNIQUE constraint to the ProductName column in the Products table.
	Alter table dbo.Products
	Add constraint uq_Products_ProductName Unique (ProductName);
	go

-- 7. Write a comment in a SQL query explaining its purpose.
/*Bu bilan bir xil nomdagi mahsulotni ikki marta kiritish bloklanadi.*/

-- 8. Add CategoryID column to the Products table.

	alter table dbo.Products
	add  CategoryID int null;
	go

	select * from Products

-- 9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.

	create table Categories 
		(CategoryID int primary key, 
		CategoryName varchar(50) unique,
		 ProductID int foreign key references Categories(CategoryID))

-- 10. Explain the purpose of the IDENTITY column in SQL Server.

	IDENTITY — avtomatik ketma-ket raqam beruvchi ustun.

	Maqsadlari:
	Yagona va oson birlamchi kalit hosil qilish

	Qo‘lda ID kiritishni talab qilmaslik

	itilgan har bir yozuvga avtomatik inkrement berish (masalan, IDENTITY(1,1) 1 dan boshlab har safar 1 ga oshiradi)

	Misol:
		CREATE TABLE dbo.Orders (
			OrderID INT IDENTITY(1,1) PRIMARY KEY,  -- 1, 2, 3, ...
			OrderDate DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

----------------------------------------Medium-Level Tasks (10)------------------------------------

-- 11. Use BULK INSERT to import data from a text file into the Products table.
		ProductID,ProductName,Price,CategoryID
		1,Apple,1.50,10
		2,Banana,0.90,10
		3,Mango,2.40,10

	Import:
	BULK INSERT dbo.Products
	from 'C:\Data\products.txt'
	with (firstrow = 2, fieldterminator = ',', rowterminator = '\r\n', tablock );

	select * from Products

-- 12. Create a FOREIGN KEY in the Products table that references the Categories table.

	Alter Table dbo.Products
	add constraint FK_Products_Categories
	foreign key (CategoryID)
	references dbo.Categories(CategoryID)
	on delete cascade
	on update cascade;


-- 13. Explain the differences between PRIMARY KEY and UNIQUE KEY.

/*PRIMARY KEY:

	Jadvaldagi asosiy identifikator (birlamchi kalit) bo‘lib, har bir satrni yagona qilib ajratib turadi.
	Har bir jadvalda faqat bitta PRIMARY KEY bo‘lishi mumkin.
	PRIMARY KEY ustun(lar)i NULL qiymat qabul qilmaydi.
	Avtomatik ravishda CLUSTERED INDEX yaratiladi (agar boshqa indeks bo‘lmasa).
	Jadval orasidagi FOREIGN KEY bog‘lanishlari odatda PRIMARY KEY orqali o‘rnatiladi.

	UNIQUE KEY:
	Jadvaldagi qiymatlar takrorlanmasligini ta’minlaydi, lekin PRIMARY KEY emas.
	Jadvalda bir nechta UNIQUE KEY bo‘lishi mumkin.
	NULL qiymatni qabul qilishi mumkin (SQL Server’da har bir UNIQUE ustun uchun bitta NULL ruxsat etiladi).
	Odatda NONCLUSTERED INDEX yaratiladi.
	PRIMARY KEY — jadvalning “asosiy identifikatori”, ma’lumotlar yaxlitligi uchun ishlatiladi.
	UNIQUE KEY — ma’lum bir ustundagi qiymatlar takrorlanmasligini ta’minlaydi, lekin asosiy kalit emas.
*/

-- 14. Add a CHECK constraint to the Products table ensuring Price > 0.

	Alter table dbo.Products
	add constraint CK_Products_Price_Positive
	check (price > 0);

-- 15. Modify the Products table to add a column Stock (INT, NOT NULL).



-- 16. Use the ISNULL function to replace NULL values in Price column with a 0.

	Alter table dbo.Products
	add stock int not null
	constraint DF_Products_Stock default (0);

-- 17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

	/*FOREIGN KEY — bu tashqi kalit bo‘lib, u bitta jadvaldagi ustunni (yoki ustunlar guruhini) boshqa jadvaldagi PRIMARY yoki UNIQUE KEY bilan bog‘laydi.
	Bu cheklov referensial yaxlitlikni (referential integrity) ta’minlaydi — ya’ni ma’lumotlar o‘rtasida mantiqiy bog‘liqlikni saqlaydi.

	Maqsadi (Purpose):
	Ma’lumotlar yaxlitligini ta’minlash
	- Masalan, Products jadvalidagi CategoryID faqat Categories jadvalidagi mavjud CategoryID qiymatlaridan biri bo‘lishi kerak.
	“Yetim yozuvlar”ni oldini olish
	- Bog‘liq jadvalda (Products) mavjud bo‘lgan qiymatning asosiy jadvalda (Categories) mos yozuvi yo‘q bo‘lishiga yo‘l qo‘ymaydi.
	Avtomatik bog‘liq o‘chirish/yangi qiymat berish imkonini yaratadi
	- ON DELETE CASCADE yoki ON UPDATE CASCADE orqali ota yozuv o‘zgarsa, bola yozuvlar ham avtomatik o‘zgaradi yoki o‘chiriladi.*/

----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

	create table dbo.Customers (
		CustomerID int primary key,
		FullName varchar(100) not null,
		Age int not null,
		Email varchar (100),
		Constraint CK_Customers_Age check (Age >=18)
	);

-- 19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.

	Create table dbo.Customers2
		(ID int identity (100,10) primary key,
		Name varchar (50)
	);

-- 20. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

	Create table dbo.OrderDetails (
		OrderID int not null,
		ProductID int not null,
		Quantity int check (Quantity > 0),
		Price Decimal (10,2) check (Price > 0),
		Constraint PK_OrderDetailt primary key (OrderID, ProductID)
	);

-- 21. Explain the use of COALESCE and ISNULL functions for handling NULL values.

/*
Bu ikki funksiya — COALESCE va ISNULL — SQL Server’da NULL qiymatlarni boshqarish (ya’ni o‘rniga boshqa qiymat qo‘yish) uchun ishlatiladi.
ISNULL(expression, replacement_value)
Agar expression qiymati NULL bo‘lsa, u holda replacement_value qaytariladi.
COALESCE(value1, value2, value3, ...)
Ro‘yxatdagi birinchi NULL bo‘lmagan qiymatni qaytaradi.
ISNULL() - Bitta ustun uchun NULLni almashtirish. Oddiy, tezkor almashtirish.
COALESCE() - Bir nechta ustunlardan birini tanlash. Kengroq tekshiruv, kompleks so‘rovlar.
*/

-- 22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.

	create table Employees (
		EmpID int primary key,
		FirstName varchar(50),
		LastName varchar(50),
		Email varchar(100) unique
	);

-- 23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.

	alter table dbo.Employees
	add constraint FK_Employees_Departments
	foreign key (DepartmentID)
	references dbo.Departments(DepartmentID)
	on delete cascade
	on update cascade;
