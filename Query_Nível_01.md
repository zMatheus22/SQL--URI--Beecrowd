# Beecrowd | Nível 01

## 2603 - Endereço dos Clientes

### Criação da tabela

```SQL
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    credit_limit FLOAT
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO customers VALUES
(DEFAULT, 'Pedro Augusto da Rocha','Rua Pedro Carlos Hoffman','Porto Alegre','RS','700.00'),
(DEFAULT, 'Antonio Carlos Mamel','Av. Pinheiros	','Belo Horizonte','MG','3500.50'),
(DEFAULT, 'Luiza Augusta Mhor','Rua Salto Grande','Niteroi','RJ','4000.00'),
(DEFAULT, 'Jane Ester','Av 7 de setembro','Erechim','RS','800.00'),
(DEFAULT, 'Marcos Antônio dos Santos','Av Farrapos','Porto Alegre','RS','4250.25');
```

### Select da tabela

```SQL
SELECT name, street
  FROM customers
 WHERE city = 'Porto Alegre';
```

### Excluindo a tabela

```SQL
DROP TABLE customers;
```

## 2607 - Cidades em Ordem Alfabética

### Criação da tabela

```SQL
CREATE TABLE providers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2)
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO providers VALUES
(DEFAULT,'Henrique','Av Brasil','Rio de Janeiro','RJ'),
(DEFAULT,'Marcelo Augusto','Rua Imigrantes','Belo Horizonte','MG'),
(DEFAULT,'Caroline Silva','Av São Paulo','Salvador','BA'),
(DEFAULT,'Guilerme Staff','Rua Central','Porto Alegre','RS'),
(DEFAULT,'Isabela Moraes','Av Juiz Grande','Curitiba','PR'),
(DEFAULT,'Francisco Accerr','Av Paulista','São Paulo','SP');
```

### Select da tabela

```SQL
SELECT DISTINCT city
  FROM providers
 ORDER BY city;
```

### Excluindo a tabela

```SQL
DROP TABLE providers;
```

## 2608 - Maior e Menor Preço

### Criação da tabela

```SQL
CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    amount INT,
    price FLOAT
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO products VALUES
(DEFAULT, 'Two-doors wardrobe', '100', '800'),
(DEFAULT, 'Dining table', '1000', '560'),
(DEFAULT, 'Towel holder', '10000', '25.50'),
(DEFAULT, 'Computer desk', '350', '320.50'),
(DEFAULT, 'Chair', '3000', '210.64'),
(DEFAULT, 'Single bed', '750', '460');
```

### Select da tabela

```SQL
SELECT max(price), min(price)
  FROM products;
```

### Excluindo a tabela

```SQL
DROP TABLE products;
```

## 2615 - Expandindo o Negocio

### Criação da tabela

```SQL
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255)
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO customers VALUES
(DEFAULT, 'Giovanna Goncalves Oliveira','Rua Mato Grosso','Canoas'),
(DEFAULT, 'Kauã Azevedo Ribeiro','Travessa Ibiá','Uberlândia'),
(DEFAULT, 'Rebeca Barbosa Santos','Rua Observatório Meteorológico','Salvador'),
(DEFAULT, 'Sarah Carvalho Correia','Rua Antônio Carlos da Silva','Uberlândia'),
(DEFAULT, 'João Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
(DEFAULT, 'Diogo Melo Dias','Rua Duzentos e Cinqüenta','Várzea Grande');
```

### Select da tabela

```SQL
SELECT DISTINCT city
  FROM customers;
```

### Excluindo a tabela

```SQL
DROP TABLE customers;
```

## 2617 - Fornecedor Ajax SA

### Criação da tabela

```SQL
CREATE TABLE providers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name CHAR(255),
    street CHAR(255),
    city CHAR(255),
    state CHAR(2)
) DEFAULT CHARSET = utf8;

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name CHAR(255),
    amount INT,
    price FLOAT,
    id_providers INT,
    FOREIGN KEY (id_providers) REFERENCES providers(id)
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO providers VALUES
(DEFAULT, 'Ajax SA','Presidente Castelo Branco','Porto Alegre','RS'),
(DEFAULT, 'Sansul SA','	Av Brasil','Rio de Janeiro','RJ'),
(DEFAULT, 'South Chairs','Av Moinho','Santa Maria','RS'),
(DEFAULT, 'Elon Electro','Apolo','São Paulo','SP'),
(DEFAULT, 'Mike Electro','Pedro da Cunha','Curitiba','PR');

INSERT INTO products VALUES
(DEFAULT,'Blue Chair','30','300.00','5'),
(DEFAULT,'Red Chair','50','2150.00','1'),
(DEFAULT,'Disney Wardrobe','400','829.50','4'),
(DEFAULT,'Blue Toaster','20','9.90','3'),
(DEFAULT,'Solar Panel','30','3000.25','4');
```

### Select da tabela

```SQL
SELECT pd.name, pv.name
  FROM providers AS pv
  JOIN products  AS pd
    ON pd.id_providers = pv.id
   AND pv.name = 'Ajax SA';
```

### Excluindo a tabela

```SQL
DROP TABLE products;
DROP TABLE providers;
```

## 2622 - Pessoas Jurídicas

### Criação da tabela

```SQL
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(2),
    credit_limit INT
) DEFAULT CHARSET = utf8;

CREATE TABLE legal_person(
    id_customers INT,
    cnpj VARCHAR(18),
    contact CHAR(100),
    FOREIGN KEY(id_customers) REFERENCES customers(id)
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO customers VALUES
(DEFAULT, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', '475'),
(DEFAULT, 'Cecília Olivia Rodrigues', 'Rua Sizuka Usuy', 'Cianorte', 'PR', '3170'),
(DEFAULT, 'Augusto Fernando Carlos Eduardo Cardoso', 'Rua Baldomiro Koerich', 'Palhoça', 'SC', '1067'),
(DEFAULT, 'Nicolas Diogo Cardoso', 'Acesso Um', 'Porto Alegre', 'RS', '475'),
(DEFAULT, 'Sabrina Heloisa Gabriela Barros', 'Rua Engenheiro Tito Marques Fernandes', 'Porto Alegre', 'RS', '4312'),
(DEFAULT, 'Joaquim Diego Lorenzo Araújo', 'Rua Vitorino', 'Novo Hamburgo', 'RS', '2314');

INSERT INTO legal_person VALUES
('4','85883842000191','99767-0562'),
('5','47773848000117','99100-8965');
```

### Select da tabela

```SQL
SELECT c.name
  FROM customers as c
  JOIN legal_person as l
    ON c.id = l.id_customers;
```

### Excluindo a tabela

```SQL
DROP TABLE legal_person;
DROP TABLE customers;
```

## 2744 - Senhas

### Criação da tabela

```SQL
CREATE TABLE account (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    login VARCHAR(255),
    password VARCHAR(255)
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO account VALUES
(DEFAULT, 'Joyce P. Parry','Promeraw','noh1Oozei'),
(DEFAULT, 'Michael T. Gonzalez','Phers1942','Iath3see9bi'),
(DEFAULT, 'Heather W. Lawless','Hankicht','diShono4'),
(DEFAULT, 'Otis C. Hitt','Conalothe','zooFohH7w'),
(DEFAULT, 'Roger N. Brownfield','Worseente','fah7ohNg');
```

### Select da tabela

```SQL
SELECT id, password, MD5(password)
  FROM account;
```

### Excluindo a tabela

```SQL
DROP TABLE account;
```

## 2746 - Virus

### Criação da tabela

```SQL
CREATE TABLE virus (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
) DEFAULT CHARSET = utf8;
```

### Inserindo dados na tabela

```SQL
INSERT INTO virus VALUES
(DEFAULT, 'H1RT'),
(DEFAULT, 'H7H1'),
(DEFAULT, 'HUN8'),
(DEFAULT, 'XH1HX'),
(DEFAULT, 'XXXX');
```

### Select da tabela

```SQL
SELECT REPLACE(name, 'H1', 'X')
  FROM virus;
```

### Excluindo a tabela

```SQL
DROP TABLE virus;
```
