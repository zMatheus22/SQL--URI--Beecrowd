-- Nivel 03

-- beecrowd SQL | 2745 - Taxas
CREATE TABLE people(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    salary DECIMAL
) DEFAULT CHARSET = utf8;

INSERT INTO people VALUES
(DEFAULT, 'James M. Tabarez', 833),
(DEFAULT, 'Rafael T. Hendon', 4281),
(DEFAULT, 'Linda J. Gardner', 4437),
(DEFAULT, 'Nicholas J. Conn', 8011),
(DEFAULT, 'Karol A. Morales', 2508),
(DEFAULT, 'Lolita S. Graves', 8709);

SELECT name, ROUND((salary * .1), 2) AS tax FROM people WHERE salary > '3000';

DROP TABLE people;


-- beecrowd SQL | 2621 - Quantidades Entre 10 e 20
CREATE TABLE providers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name CHAR(255),
    street CHAR(255),
    city CHAR(255),
    state CHAR(2)
) DEFAULT CHARSET = utf8;

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name CHAR(255),
    amount INT,
    price FLOAT,
    id_providers INT,
    FOREIGN KEY (id_providers) REFERENCES providers(id)
) DEFAULT CHARSET = utf8;

INSERT INTO providers VALUES
(DEFAULT, 'Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
(DEFAULT, 'Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
(DEFAULT, 'Pr Sheppard Chairs','Rua do Moinho','Santa Maria','RS'),
(DEFAULT, 'Elon Electro','Rua Apolo','São Paulo','SP'),
(DEFAULT, 'Mike Electro','Rua Pedro da Cunha','Curitiba','PR');

INSERT INTO products VALUES
(DEFAULT, 'Blue Chair','30','300.00','5'),
(DEFAULT, 'Red Chair','50','2150.00','2'),
(DEFAULT, 'Disney Wardrobe','400','829.50','4'),
(DEFAULT, 'Executive Chair','17','9.90','3'),
(DEFAULT, 'Solar Panel','30','3000.25','4');

SELECT products.name FROM products 
JOIN providers ON products.id_providers = providers.id
WHERE providers.name LIKE 'P%' AND amount BETWEEN 10 AND 20;

DROP TABLE products;
DROP TABLE providers;


-- beecrowd SQL | 2606 - Categorias
CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
) DEFAULT CHARSET = utf8;

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(255),
    amount	INT,
    price	FLOAT,
    id_categories INT,
    FOREIGN KEY (id_categories) REFERENCES categories(id)
) DEFAULT CHARSET = utf8;


INSERT INTO categories VALUES
(DEFAULT,'old stock'),
(DEFAULT,'new stock'),
(DEFAULT,'modern'),
(DEFAULT,'commercial'),
(DEFAULT,'recyclable'),
(DEFAULT,'executive'),
(DEFAULT,'superior'),
(DEFAULT,'wood'),
(DEFAULT,'super luxury'),
(DEFAULT,'vintage');

INSERT INTO products VALUES
(DEFAULT,'Lampshade','100','800','4'),
(DEFAULT,'Table for painting','1000','560','9'),
(DEFAULT,'Notebook desk','10000','25.50','9'),
(DEFAULT,'Computer desk','350','320.50','6'),
(DEFAULT,'Chair','3000','210.64','9'),
(DEFAULT,'Home alarm','750','460','4');

SELECT p.id, p.name FROM products AS p
JOIN categories AS c ON p.id_categories = c.id
WHERE c.name LIKE 'super%';

DROP TABLE products;
DROP TABLE categories;

-- beecrowd SQL | 2993 - Mais Frequente
CREATE TABLE value_table(
    amount INT
) DEFAULT CHARSET = utf8;

INSERT INTO value_table VALUES
('4'), ('6'), ('7'),
('1'), ('1'), ('2'),
('3'), ('2'), ('3'),
('1'), ('5'), ('6'),
('1'), ('7'), ('8'), 
('9'), ('10'), ('11'), 
('12'), ('4'), ('5'), 
('5'), ('3'), ('6'),
('2'), ('2'), ('1');

SELECT amount AS most_frequent_value FROM value_table 
GROUP BY amount ORDER BY COUNT(amount) DESC LIMIT 1;

DROP TABLE value_table;

-- beecrowd SQL | 2610 - Valor Médio dos Produtos
CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(255),
    amount	INT,
    price FLOAT   
)DEFAULT CHARSET = utf8;

INSERT INTO products VALUES
(DEFAULT, 'Two-doors wardrobe', '100', '800'),
(DEFAULT, 'Dining table', '1000', '560'),
(DEFAULT, 'Towel holder', '10000', '25.50'),
(DEFAULT, 'Computer desk', '350', '320.50'),
(DEFAULT, 'Chair', '3000', '210.64'),
(DEFAULT, 'Single bed', '750', '460');

SELECT ROUND(AVG(price), 2) FROM products;

DROP TABLE products;

-- beecrowd SQL | 2620 - Pedidos no Primeiro Semestre
CREATE TABLE customers (
    id      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(255),
    street  VARCHAR(255),
    city    VARCHAR(255),
    state   CHAR(2),
    credit_limit INT
) DEFAULT CHARSET = utf8;

CREATE TABLE orders(
    id      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    orders_date DATE,
    id_customers INT,
    FOREIGN KEY (id_customers) REFERENCES customers(id)
)DEFAULT CHARSET = utf8;

INSERT INTO customers VALUES
(DEFAULT, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', '475'),
(DEFAULT, 'Cecília Olivia Rodrigues', 'Rua Sizuka Usuy', 'Cianorte', 'PR', '3170'),
(DEFAULT, 'Augusto Fernando Carlos Eduardo Cardoso', 'Rua Baldomiro Koerich', 'Palhoça', 'SC', '1067'),
(DEFAULT, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', '475'),
(DEFAULT, 'Sabrina Heloisa Gabriela Barros', 'Rua Engenheiro Tito Marques Fernandes', 'Porto Alegre', 'RS', '4312'),
(DEFAULT, 'Joaquim Diego Lorenzo Araújo', 'Rua Vitorino', 'Novo Hamburgo', 'RS', '2314');


INSERT INTO orders VALUES
(DEFAULT, '2016-05-13','3'),
(DEFAULT, '2016-01-12','2'),
(DEFAULT, '2016-04-18','5'),
(DEFAULT, '2016-09-07','4'),
(DEFAULT, '2016-02-13','6'),
(DEFAULT, '2016-08-05','3');

SELECT c.name, o.id FROM customers AS c 
JOIN orders AS o ON o.id_customers = c.id 
WHERE o.orders_date BETWEEN '2016-01-01' AND '2016-06-30';

DROP TABLE orders;
DROP TABLE customers;

-- beecrowd SQL | 2624 - Quantidades de Cidades por Clientes
CREATE TABLE customers (
    id      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(255),
    street  VARCHAR(255),
    city    VARCHAR(255),
    state   CHAR(2),
    credit_limit INT
) DEFAULT CHARSET = utf8;

INSERT INTO customers VALUES
(DEFAULT, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', '475'),
(DEFAULT, 'Cecília Olivia Rodrigues', 'Rua Sizuka Usuy', 'Cianorte', 'PR', '3170'),
(DEFAULT, 'Augusto Fernando Carlos Eduardo Cardoso', 'Rua Baldomiro Koerich', 'Palhoça', 'SC', '1067'),
(DEFAULT, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', '475'),
(DEFAULT, 'Sabrina Heloisa Gabriela Barros', 'Rua Engenheiro Tito Marques Fernandes', 'Porto Alegre', 'RS', '4312'),
(DEFAULT, 'Joaquim Diego Lorenzo Araújo', 'Rua Vitorino', 'Novo Hamburgo', 'RS', '2314');

SELECT COUNT(DISTINCT city) FROM customers;

DROP TABLE customers;

-- beecrowd SQL | 2743 - Quantidade de Caracteres
CREATE TABLE people(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
) DEFAULT CHARSET = utf8;

INSERT INTO people VALUES
(DEFAULT,'Karen'),
(DEFAULT,'Manuel'),
(DEFAULT,'Ygor'),
(DEFAULT,'Valentine'),
(DEFAULT,'Jo');

SELECT name, LENGTH(name) FROM people ORDER BY LENGTH(name) DESC;

DROP TABLE people;

-- beecrowd SQL | 2618 - Produtos Importados
CREATE TABLE providers (
    id      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(255),
    street  VARCHAR(255),
    city    VARCHAR(255),
    state   CHAR(2)
) DEFAULT CHARSET = utf8;

CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
)DEFAULT CHARSET = utf8;

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    amount INT,
    price FLOAT,
    id_providers INT,
    id_categories INT,
    FOREIGN KEY (id_providers) REFERENCES providers(id),
    Foreign Key (id_categories) REFERENCES categories(id)
)DEFAULT CHARSET = utf8;

INSERT INTO categories VALUES
(DEFAULT, 'Super Luxury'),
(DEFAULT, 'Imported'),
(DEFAULT, 'Tech'),
(DEFAULT, 'Vintage'),
(DEFAULT, 'Supreme');

INSERT INTO providers VALUES
(DEFAULT,'Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
(DEFAULT,'Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
(DEFAULT,'South Chairs','Rua do Moinho','Santa Maria','RS'),
(DEFAULT,'Elon Electro','Rua Apolo','São Paulo','SP'),
(DEFAULT,'Mike Electro','Rua Pedro da Cunha','Curitiba','PR');

INSERT INTO products VALUES
(DEFAULT, 'Blue Chair', '30', '300.00', '5', '5'),
(DEFAULT, 'Red Chair', '50', '2150.00', '2', '1'),
(DEFAULT, '	Disney Wardrobe', '400', '829.50', '4', '1'),
(DEFAULT, 'Blue Toaster', '20', '9.90', '3', '1'),
(DEFAULT, 'TV', '30', '3000.25', '2', '2');

SELECT pd.name, pv.name, c.name FROM products AS pd
JOIN categories AS c ON pd.id_categories = c.id 
JOIN providers AS pv ON pd.id_providers = pv.id
WHERE pv.name LIKE 'Sansul SA' AND c.name LIKE 'Imported';

DROP TABLE products;
DROP TABLE providers;
DROP TABLE categories;