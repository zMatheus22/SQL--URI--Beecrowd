-- Nivel 02

-- beecrowd SQL | 2994 - Quanto Ganha um Médico?
CREATE TABLE doctors(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
) DEFAULT CHARSET = utf8;

CREATE TABLE work_shifts(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    bonus INT
) DEFAULT CHARSET = utf8;

CREATE TABLE attendances(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_doctor INT,
    hours INT,
    id_work_shift INT, 
    Foreign Key (id_doctor) REFERENCES doctors(id),
    Foreign Key (id_work_shift) REFERENCES work_shifts(id)
) DEFAULT CHARSET = utf8;


INSERT INTO doctors VALUES
(DEFAULT, 'Arlino'),
(DEFAULT, 'Tiago'),
(DEFAULT, 'Amanda'),
(DEFAULT, 'Wellington');


INSERT INTO work_shifts VALUES 
(DEFAULT, 'nocturnal', '15'),
(DEFAULT, 'afternoon', '2'),
(DEFAULT, 'day', '1');

INSERT INTO attendances VALUES
(DEFAULT,'1','5','1'),
(DEFAULT,'3','2','1'),
(DEFAULT,'3','3','2'),
(DEFAULT,'2','2','3'),
(DEFAULT,'1','5','3'),
(DEFAULT,'4','1','3'),
(DEFAULT,'4','2','1'),
(DEFAULT,'3','2','2'),
(DEFAULT,'2','4','2');

SELECT d.name, ROUND(SUM((a.hours * 150) + ((a.hours * 15) * w.bonus) * .1), 1) AS salary 
FROM doctors AS d JOIN attendances AS a ON a.id_doctor = d.id 
JOIN work_shifts AS w ON w.id = a.id_work_shift GROUP BY d.name 
ORDER BY salary desc;

DROP TABLE attendances;
DROP TABLE doctors;
DROP TABLE work_shifts;


-- beecrowd SQL | 2613 - Filmes em Promoção

CREATE TABLE prices(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categorie VARCHAR(100),
    value FLOAT
) DEFAULT CHARSET = utf8;

CREATE TABLE movies(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    id_prices INT,
    Foreign Key (id_prices) REFERENCES prices(id)
) DEFAULT CHARSET = utf8;


INSERT INTO prices VALUES
(DEFAULT, 'Releases','3.50'),
(DEFAULT, 'Bronze Seal','2.00'),
(DEFAULT, 'Silver Seal','2.50'),
(DEFAULT, 'Gold Seal','3.00'),
(DEFAULT, 'Promotion','1.50');

INSERT INTO movies VALUES
(DEFAULT, 'Batman','3'),
(DEFAULT, 'The Battle of the Dark River','3'),
(DEFAULT, 'White Duck','5'),
(DEFAULT, 'Breaking Barriers','4'),
(DEFAULT, 'The Two Hours','2');

SELECT m.id, name FROM movies AS m 
JOIN prices AS p ON p.id = m.id_prices WHERE p.value < '2.00';

DROP TABLE movies;
DROP TABLE prices;

-- beecrowd SQL | 2619 - Super Luxo
CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
) DEFAULT CHARSET = utf8;

CREATE TABLE providers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    street	VARCHAR(255),
    city	VARCHAR(255),
    state   CHAR(2)
) DEFAULT CHARSET = utf8;

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    amount INT,
    price FLOAT,
    id_providers INT,
    id_categories INT,
    FOREIGN Key (id_providers) REFERENCES providers(id),
    FOREIGN Key (id_categories) REFERENCES categories(id)
) DEFAULT CHARSET = utf8;

INSERT INTO categories VALUES
(DEFAULT, 'Super Luxury'),
(DEFAULT, 'Imported'),
(DEFAULT, 'Tech'),
(DEFAULT, 'Vintage'),
(DEFAULT, 'Supreme');

INSERT INTO providers VALUES
(DEFAULT, 'Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
(DEFAULT, 'Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
(DEFAULT, 'South Chairs','Rua do Moinho','Santa Maria','RS'),
(DEFAULT, 'Elon Electro','Rua Apolo','São Paulo','SP'),
(DEFAULT, 'Mike electro','Rua Pedro da Cunha','Curitiba','PR');

INSERT INTO products VALUES
(DEFAULT,'Blue Chair','30','300.00','5','5'),
(DEFAULT,'Red Chair','50','2150.00','2','1'),
(DEFAULT,'Disney Wardrobe','400','829.50','4','1'),
(DEFAULT,'Blue Toaster','20','9.90','3','1'),
(DEFAULT,'TV','30','3000.25','2','2');

SELECT products.name, providers.name, ROUND(products.price, 2) FROM products 
JOIN providers ON products.id_providers = providers.id 
JOIN categories ON categories.id = products.id_categories
WHERE price > '1000' AND categories.name = 'Super Luxury';

DROP TABLE products;
DROP TABLE categories;
DROP TABLE providers;

-- beecrowd SQL | 2604 - Menores que 10 ou Maiores que 100
CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    amount INT,
    price FLOAT
) DEFAULT CHARSET = utf8;

INSERT INTO products VALUES
(DEFAULT,'Two-door wardrobe', '100','80'),
(DEFAULT, 'Dining table','1000','560'),
(DEFAULT, 'Towel holder','10000','5.50'),
(DEFAULT, 'Computer desk','350','100'),
(DEFAULT, 'Chair','3000','210.64'),
(DEFAULT, 'Single bed','750','99');

SELECT id, name FROM products WHERE price < '10' OR price > '100';

DROP TABLE products;