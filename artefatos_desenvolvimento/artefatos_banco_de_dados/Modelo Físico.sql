/*Modelo Físico - SisMerc (MySql)*/

CREATE DATABASE sismerc;

USE sismerc;

CREATE TABLE Tipo_Usuario(
	idtipousuario INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Usuario(
	idusuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	cpf CHAR(15) NOT NULL,
	id_tipousuairo INT NOT NULL,
	FOREIGN KEY(id_tipousuairo)
	REFERENCES Tipo_Usuario(idtipousuario)
);

CREATE TABLE Endereco(
	idendereco INT PRIMARY KEY AUTO_INCREMENT,
	rua VARCHAR(25) NOT NULL,
	bairro VARCHAR(15) NOT NULL,
	cidade VARCHAR(20) NOT NULL,
	estado char(2) NOT NULL,
	complemento VARCHAR(25),
	id_usuario INT UNIQUE NOT NULL,
	FOREIGN KEY(id_usuario)
	REFERENCES Usuario(idusuario)
);

CREATE TABLE Telefone(
	idtelefone INT PRIMARY KEY AUTO_INCREMENT,
	tipo_telefone ENUM('CEL', 'RES') NOT NULL,
	numero VARCHAR(15) NOT NULL,
	id_usuario INT UNIQUE NOT NULL,
	FOREIGN KEY(id_usuario)
	REFERENCES Usuario(idusuario)
);

CREATE TABLE Categoria(
	idcategoria INT PRIMARY KEY AUTO_INCREMENT,
	nome varchar(15) NOT NULL
);

CREATE TABLE Produto(
	idproduto INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(15) NOT NULL,
	preco FLOAT(4,2) NOT NULL,
	id_categoria INT NOT NULL,
	FOREIGN KEY(id_categoria)
	REFERENCES Categoria(idcategoria)
);

CREATE TABLE Venda(
	idvenda INT PRIMARY KEY AUTO_INCREMENT,
	valor FLOAT(10,3) NOT NULL,
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario)
	REFERENCES Usuario(idusuario)
);

CREATE TABLE Produto_Venda(
	idprodutovenda INT PRIMARY KEY AUTO_INCREMENT,
	id_produto INT,
	id_venda INT,
	FOREIGN KEY(id_produto) REFERENCES Produto(idproduto),
	FOREIGN KEY(id_venda) REFERENCES Venda(idvenda)
	
);














