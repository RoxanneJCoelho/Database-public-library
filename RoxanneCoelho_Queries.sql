-- 4 queries simples
-- 1. Quantos exemplares estão na biblioteca?
SELECT COUNT(*) AS quant_exemplares
FROM Exemplar;

-- 2. Mostre o email e telefone do utente Paulo
SELECT email, telefone
FROM Utente
WHERE nome LIKE 'Paulo%';

-- 3. Ordene os funcionarios por ordem alfabética
SELECT * 
FROM Funcionario
ORDER BY Nome ASC;

-- 4. Indique os autores dos livros publicados entre 2015 e 2020
SELECT Autor 
FROM livro
WHERE Ano_Publicacao BETWEEN 2015 AND 2020;

-- 3 queries intermédias
-- 1. Indique os nomes dos utentes que pediram livros emprestados na biblioteca em novembro de 2024 
SELECT Utente.Nome
FROM Emprestimo
INNER JOIN Utente ON Emprestimo.ID_Utente = Utente.ID_Utente
WHERE Emprestimo.Data_Emprestimo BETWEEN '2024-11-01' AND '2024-11-30';

--2. Houve pedidos de prolongamento? Se sim, quantos pedidos de prolongamento foram feitos, quando foi feito e indique o nome dos funcionários que executaram os pedidos
SELECT COUNT(Emprestimo.ID_Emprestimo) AS Quant_Prolongamentos,
       Emprestimo.Data_Prolongamento,
       Funcionario.Nome AS Nome_Funcionario
FROM Emprestimo
INNER JOIN Funcionario ON Emprestimo.ID_Funcionario = Funcionario.ID_funcionario
WHERE Emprestimo.Prolongamento = 1;

--3. Houve algum funcionário a requisitar livros para si? Se sim, indique o nome do funcionário e o titulo do livro que requisitou
SELECT Funcionario.Nome AS Nome_Funcionario, 
       Livro.Titulo AS Titulo_Livro
FROM Emprestimo
INNER JOIN Funcionario ON Emprestimo.ID_Funcionario = Funcionario.ID_funcionario
INNER JOIN Exemplar ON Emprestimo.ID_Exemplar = Exemplar.ID_exemplar
INNER JOIN Livro ON Exemplar.ISBN = Livro.ISBN
WHERE Emprestimo.ID_Utente = Emprestimo.ID_Funcionario;

-- 2 queries avancadas
-- 1. Existem livros com mais de 1 exemplar? Se sim, indique quantos são por livro e quais são os titulos por ordem crescente de ID
SELECT Exemplar.ID_exemplar, COUNT(Exemplar.ID_exemplar) AS Quantidade_Exemplares, Livro.Titulo
FROM Exemplar
INNER JOIN Livro ON Exemplar.ISBN = Livro.ISBN
GROUP BY Livro.Titulo
HAVING COUNT(Exemplar.ID_exemplar) > 1
ORDER BY exemplar.ID_exemplar ASC;

--2. Indique o nome do utente com ID igual a 1, o total de reservas que fez, a data de solicitacao das mesmas e o funcionario que efetuou o pedido
SELECT utente.Nome, 
       (SELECT COUNT(*) 
        FROM Reserva 
        WHERE reserva.ID_Utente = utente.ID_Utente) AS Total_Reservas,
       reserva.Data_Solicitacao,
       funcionario.Nome AS Nome_Funcionario
FROM Utente 
JOIN Reserva ON reserva.ID_Utente = utente.ID_Utente
JOIN Funcionario ON funcionario.ID_Funcionario = reserva.ID_Funcionario
WHERE utente.ID_Utente = 1;