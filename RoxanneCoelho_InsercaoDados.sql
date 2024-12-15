-- inserção de dados na tabela livro
INSERT INTO livro (ISBN, Titulo, Autor, Editora, Ano_Publicacao) VALUES
(9789723105098, 'A República', 'Platão', 'Fundação Calouste Gulbenkian', 2021),
(9788461205950, 'Orgulho e Preconceito', 'Jane Austen', 'Biblioteca Sábado', 2008),
(9789722230193, 'A Origem das Espécies', 'Charles Darwin', 'Verbo', 2011),
(9789726650256, 'A Brusca', 'Agustina Bessa Luis', 'Verbo', 1998),
(9789899118515, 'Oceano de Plástico', 'Paula Sobral', 'Fundação Francisco Manuel dos Santos', 2022),
(9789720046895, 'Levantado do Chão', 'José Saramago', 'Porto Editora', 2014),
(9789898424150, 'A Ciência em Portugal', 'Carlos Fiolhais', 'Fundação Francisco Manuel dos Santos', 2011),
(9788574321509, 'Estarão as Prisões Obsoletas?', 'Angela Davis', 'Difel', 2018),
(9786587235127, 'Ensinando Pensamento Crítico', 'Bell Hooks', 'Elefante', 2020),
(9780349107035, 'Cosmos', 'Carl Sagan', 'Abacus', 1983),
(9788535906882, 'Biologia, Ciência Única', 'Ernst Mayr', 'Companhia das Letras', 2005),
(9789897241710, 'Cartas a um Jovem Cientista', 'Edward O. Wilson', 'Clube do Autor', 2014),
(9789723829129, 'O Velho e o Mar', 'Ernest Hemingway', 'Livros do Brasil', 2015),
(9789897023033, 'As Aventuras de Huckleberry Finn', 'Mark Twain', 'Editora Guerra & Paz', 2017),
(9789895644513, 'Os Sete Maridos de Evelyn Hugo', 'Taylor Jenkins Reid', 'TopSeller', 2021)

-- inserção da dados na tabela exemplar

INSERT INTO exemplar (N_Exemplar, Disponibilidade, ISBN) VALUES
(1, 1, 9789723105098),
(2, 1, 9789723105098),
(3, 1, 9789723105098),
(1, 1, 9788461205950),
(2, 1, 9788461205950),
(1, 1, 9789722230193),
(2, 1, 9789722230193),
(3, 1, 9789722230193),
(1, 1, 9789726650256),
(1, 1, 9789899118515),
(1, 1, 9789720046895),
(2, 1, 9789720046895),
(1, 1, 9789898424150),
(2, 1, 9789898424150),
(1, 1, 9788574321509),
(2, 1, 9788574321509),
(3, 1, 9788574321509),
(1, 1, 9786587235127),
(2, 1, 9786587235127),
(1, 1, 9780349107035),
(1, 1, 9788535906882),
(2, 1, 9788535906882),
(1, 1, 9789897241710),
(2, 1, 9789897241710),
(3, 1, 9789897241710),
(1, 1, 9789723829129),
(1, 1, 9789897023033),
(2, 1, 9789897023033),
(1, 1, 9789895644513),
(2, 1, 9789895644513)

-- inserção de dados na tabela utente

INSERT INTO utente(nome, email, telefone) VALUES
('João Pedro Pinto Sousa', 'joaosousa22@gmail.com', 912654789),
('Raquel Santiago Patrício', 'rsp654@outlook.com', 935999887),
('Ana Margarida Coelho Pacheco', 'margaridacp@gmail.com', 924435560),
('Maria Clara Tomás Ventura', 'mariactv@hotmail.com', 912098987),
('Daniel Augusto Madureira', 'danielmadu@hotmail.com', 913626789),
('Isabel Coelho Pinheiro', 'icp534@gmail.com', 933567543),
('José Diogo Alberto Seixas', 'jose2004@gmail.com', 965123433),
('Paulo Morais Costa', 'paulomcosta@outlook.com', 921009089)

-- inserção de dados na tabela funcionário
INSERT INTO funcionario (nome, email, telefone, id_utente) VALUES
('Ana Rita Cerqueira Pereira', 'anarita@bm.pt', 915234432, 9),
('Ricardo Antunes Teixeira', 'ricardo@bm.pt', 930675987, 10),
('Josefina Jesus Torres', 'josefina@bm.pt', 967987543, 11),
('Armando José Pinto Coelho', 'armandojcp@bm.pt', 911111009, 12)

-- inserção de dados na tabela empréstimo
INSERT INTO emprestimo(Data_Emprestimo, Data_Devolucao, Prolongamento, Data_Prolongamento, ID_Utente, ID_Funcionario, ID_Exemplar) VALUES
('2024-10-10', '2024-11-10', 1, '2024-10-20', 10,1,17),
('2024-10-23', '2024-11-23',0, NULL , 7,3,10),
('2024-11-02', '2024-12-02',0, NULL, 2,2,11),
('2024-11-07', '2024-12-07', 0, NULL, 3,1,4),
('2024-11-08','2024-12-08',0, NULL, 5,4,15)


-- inserção de dados na tabela reserva
INSERT INTO reserva (Data_Solicitacao, ID_Utente, ID_Funcionario, ID_Exemplar) VALUES
('2024-10-28',8,3,11),
('2024-10-30', 1,2, 10),
('2024-11-08', 6,4,4),
('2024-11-09', 12,3,15)


