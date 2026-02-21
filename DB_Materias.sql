CREATE DATABASE Materiais;
USE Materiais;

CREATE TABLE Vendas (
    ID_Venda INT PRIMARY KEY AUTO_INCREMENT,
    Produto VARCHAR(50),
    Quantidade INT,
    Valor_Total DECIMAL(10, 2)
);

INSERT INTO Vendas (Produto, Quantidade, Valor_Total) VALUES
('Livro SQL Básico', 3, 120.00),
('Caneta Azul', 10, 15.00),
('Caderno Espiral', 5, 50.00),
('Mochila Escolar', 2, 250.00);

SELECT * FROM Vendas WHERE Quantidade > 5 ORDER BY Valor_Total DESC;

UPDATE Vendas SET Valor_Total = 135.00 WHERE Produto = 'Livro SQL Básico';

SELECT SUM(Valor_Total) AS Soma_Total_Vendas, AVG(Quantidade) AS Media_Produtos_Vendidos FROM Vendas;

DELETE FROM Vendas WHERE Quantidade < 5;

CREATE TABLE Clientes(
ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50)
);

INSERT INTO Clientes (Nome) 
VALUES ('João Silva'),
('Maria Oliveira');

ALTER TABLE Vendas ADD COLUMN ID_Cliente INT, ADD FOREIGN KEY (ID_Cliente) 
REFERENCES Clientes(ID_Cliente);

UPDATE Vendas SET ID_Cliente = (SELECT ID_Cliente 
FROM Clientes WHERE Nome = 'João Silva') 
WHERE Produto IN ('Livro SQL Básico', 'Caneta Azul');

UPDATE Vendas SET ID_Cliente = (SELECT ID_Cliente
FROM Clientes WHERE Nome = 'Maria Oliveira')
WHERE Produto IN ('Caderno Espiral', 'Mochila Escolar');

SELECT V.Produto, C.Nome AS Nome_Cliente
FROM Vendas AS V JOIN Clientes AS C ON V.ID_Cliente = C.ID_Cliente;