CREATE TABLE Endereco (
  idEndereco INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Rua VARCHAR(100),
  Numero VARCHAR(10),
  Complemento VARCHAR(20),
  Bairro VARCHAR(100),
  CEP VARCHAR(15),
  Cidade VARCHAR(50),
  Estado VARCHAR(50),
  PRIMARY KEY(idEndereco)
);

CREATE TABLE Hotel (
  ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Endereco_idEndereco INT UNSIGNED NOT NULL,
  Nome VARCHAR(50),
  Categoria VARCHAR(50),
  Telefone VARCHAR(15),
  Email VARCHAR(150),
  PRIMARY KEY(ID),
  INDEX (Endereco_idEndereco),
  CONSTRAINT FK_Hotel_Endereco FOREIGN KEY (Endereco_idEndereco)
    REFERENCES Endereco (idEndereco)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Funcionario (
  idFuncionario INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Endereco_idEndereco INT UNSIGNED NOT NULL,
  HOTEL_ID INT UNSIGNED NOT NULL,
  CPF VARCHAR(14),
  Nome VARCHAR(150),
  Telefone VARCHAR(15),
  Email VARCHAR(100),
  Login VARCHAR(100),
  Senha VARCHAR(100),
  PRIMARY KEY(idFuncionario),
  INDEX (HOTEL_ID),
  INDEX (Endereco_idEndereco),
  CONSTRAINT FK_Funcionario_Endereco FOREIGN KEY (Endereco_idEndereco)
    REFERENCES Endereco (idEndereco)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_Funcionario_Hotel FOREIGN KEY (HOTEL_ID)
    REFERENCES Hotel (ID)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Hospede (
  idHospede INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Endereco_idEndereco INT UNSIGNED NOT NULL,
  CPF VARCHAR(14),
  Nome VARCHAR(150),
  Telefone VARCHAR(15),
  Email VARCHAR(150),
  PRIMARY KEY(idHospede),
  INDEX (Endereco_idEndereco),
  CONSTRAINT FK_Hospede_Endereco FOREIGN KEY (Endereco_idEndereco)
    REFERENCES Endereco (idEndereco)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Pagamento (
  idPagamento INT UNSIGNED NOT NULL AUTO_INCREMENT,
  FormasPag VARCHAR(50),
  DataPagamento DATE,
  ValorTotal DECIMAL(10,2),
  StatusPagamento VARCHAR(50),
  PRIMARY KEY(idPagamento)
);

CREATE TABLE Quarto (
  idQuarto INT UNSIGNED NOT NULL AUTO_INCREMENT,
  HOTEL_ID INT UNSIGNED NOT NULL,
  NumLeitos INT UNSIGNED,
  Tipo VARCHAR(50),
  PrecoDiaria DECIMAL(10,2),
  StatusQuarto VARCHAR(50),
  PRIMARY KEY(idQuarto),
  INDEX (HOTEL_ID),
  CONSTRAINT FK_Quarto_Hotel FOREIGN KEY (HOTEL_ID)
    REFERENCES Hotel (ID)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Reserva (
  idReserva INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Pagamento_idPagamento INT UNSIGNED NOT NULL,
  Hospede_idHospede INT UNSIGNED NOT NULL,
  Funcionario_idFuncionario INT UNSIGNED NOT NULL,
  DataEntrada DATE,
  DataSaida DATE,
  StatusReserva VARCHAR(50),
  PRIMARY KEY(idReserva),
  INDEX (Funcionario_idFuncionario),
  INDEX (Hospede_idHospede),
  INDEX (Pagamento_idPagamento),
  CONSTRAINT FK_Reserva_Funcionario FOREIGN KEY (Funcionario_idFuncionario)
    REFERENCES Funcionario (idFuncionario)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_Reserva_Hospede FOREIGN KEY (Hospede_idHospede)
    REFERENCES Hospede (idHospede)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_Reserva_Pagamento FOREIGN KEY (Pagamento_idPagamento)
    REFERENCES Pagamento (idPagamento)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ReservaQuarto (
  Reserva_idReserva INT UNSIGNED NOT NULL,
  Quarto_idQuarto INT UNSIGNED NOT NULL,
  StatusReservaQuarto VARCHAR(50),
  PRIMARY KEY (Reserva_idReserva, Quarto_idQuarto),
  CONSTRAINT FK_ReservaQuarto_Reserva FOREIGN KEY (Reserva_idReserva)
    REFERENCES Reserva (idReserva)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT FK_ReservaQuarto_Quarto FOREIGN KEY (Quarto_idQuarto)
    REFERENCES Quarto (idQuarto)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

