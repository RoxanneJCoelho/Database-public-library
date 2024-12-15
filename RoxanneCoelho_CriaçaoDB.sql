-- criação de base de dados da Biblioteca Municipal
CREATE DATABASE BibliotecaMunicipal;
GO

USE BibliotecaMunicipal;
GO

-- criação da tabela Livro
CREATE TABLE Livro (
    ISBN CHAR(13) PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    Autor VARCHAR(150) NOT NULL,
    Editora VARCHAR(20),
    Ano_Publicacao INT
);

-- criação da tabela Exemplar
CREATE TABLE Exemplar (
    ID_exemplar INT PRIMARY KEY AUTO_INCREMENT,
    N_Exemplar INT NOT NULL CHECK (N_Exemplar IN (1, 2, 3)), -- cada livro apenas pode ter 3 exemplares na biblioteca, entao adiciona-se uma restrição
    Disponibilidade BIT DEFAULT 1, -- 1 significa disponível, 0 significa indisponível
    ISBN CHAR (13) REFERENCES Livro(ISBN),
    UNIQUE (ISBN, N_Exemplar) -- garante que cada ISBN pode ter apenas exemplares 1, 2 ou 3 sem repetição
);

-- criação da tabela Utente 
CREATE TABLE Utente (
    ID_Utente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(150) NOT NULL,
    Email VARCHAR(150),
    Telefone VARCHAR(20)
);

-- criação da tabela Funcionario
CREATE TABLE Funcionario (
    ID_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(150) NOT NULL,
    Email VARCHAR(150),
    Telefone VARCHAR(20),
    ID_Utente INT REFERENCES Utente(ID_Utente)
);

-- criação da tabela Emprestimo
CREATE TABLE Emprestimo (
    ID_Emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    Data_Emprestimo DATE NOT NULL,
    Data_Devolucao DATE NOT NULL,
    Prolongamento BIT DEFAULT 0, -- 1 significa que pediu prolongamento, 0 significa que não pediu
    Data_Prolongamento DATE,
    ID_Utente INT REFERENCES Utente(ID_Utente),
    ID_Funcionario INT REFERENCES Funcionario(ID_Funcionario),
    ID_Exemplar INT REFERENCES Exemplar(ID_Exemplar)
);

-- criação da tabela Reserva
CREATE TABLE Reserva (
    ID_Reserva INT PRIMARY KEY AUTO_INCREMENT,
    Data_Solicitacao DATE NOT NULL,
    ID_Utente INT REFERENCES Utente(ID_Utente),
    ID_Funcionario INT REFERENCES Funcionario(ID_Funcionario),
    ID_Exemplar INT REFERENCES Exemplar(ID_Exemplar)
  );