DROP SCHEMA IF EXISTS `mecanica_lamborghini`; 

CREATE SCHEMA `mecanica_lamborghini`;

USE `mecanica_lamborghini`;

CREATE TABLE Usuario 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,   
 TipoUser ENUM('User', 'Mec'),  
 Nome VARCHAR(255),  
 CPF VARCHAR(11) NOT NULL,  
 Celular VARCHAR(11),  
 email VARCHAR(255),  
 Login VARCHAR(255),  
 Senha VARCHAR(50), 
 unique (login)
); 

CREATE TABLE Orcamento 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,    
 TotalPeca FLOAT,  
 TotalServico FLOAT,  
 ValorTotal FLOAT,  
 Descricao VARCHAR(1000),  
 Status VARCHAR(50),  
 idCarro INT,  
 idUsuario INT  
); 

CREATE TABLE Carro 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,   
 Modelo VARCHAR(50),  
 Cor VARCHAR(50),  
 Placa VARCHAR(7),  
 Ano INT(4),  
 Marca VARCHAR(50),  
 idUsuario INT  
); 

CREATE TABLE Servico 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 Nome VARCHAR(50),  
 ValorAtual FLOAT,  
 UnMedida VARCHAR(20) 
); 

CREATE TABLE ItemServico 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,    
 Qnt INT(2),  
 ValorUn FLOAT,  
 ValorTotal FLOAT,  
 idServico INT,  
 idOrcamento INT  
); 

CREATE TABLE ItemPeca 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,   
 Qnt INT(3),  
 ValorUn FLOAT,  
 ValorTotal FLOAT,  
 idOrcamento INT,  
 idPeca INT  
);

CREATE TABLE Peca 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,    
 Nome VARCHAR(50),  
 ValorAtual FLOAT,  
 UnMedida VARCHAR(20)  
);

ALTER TABLE Orcamento ADD FOREIGN KEY(idCarro) REFERENCES Carro (id);
ALTER TABLE Orcamento ADD FOREIGN KEY(idUsuario) REFERENCES Usuario (id);
ALTER TABLE Carro ADD FOREIGN KEY(idUsuario) REFERENCES Usuario (id);
ALTER TABLE ItemServico ADD FOREIGN KEY(idServico) REFERENCES Servico (id);
ALTER TABLE ItemServico ADD FOREIGN KEY(idOrcamento) REFERENCES Orcamento (id);
ALTER TABLE ItemPeca ADD FOREIGN KEY(idOrcamento) REFERENCES Orcamento (id);
ALTER TABLE ItemPeca ADD FOREIGN KEY(idPeca) REFERENCES Peca (id);

USE `mecanica_lamborghini`;

INSERT INTO `mecanica_lamborghini`.`usuario` (`TipoUser`, `Nome`, `CPF`, `Celular`, `email`, `Login`, `Senha`) VALUES ('Mec', 'Mecanico', '11111111111', '47000000000', 'mecanico@teste.com', 'mecanico', '123');
INSERT INTO `mecanica_lamborghini`.`usuario` (`TipoUser`, `Nome`, `CPF`, `Celular`, `email`, `Login`, `Senha`) VALUES ('User', 'Cliente', '22222222222', '47999999999', 'cliente@teste.com', 'cliente', '123');
INSERT INTO `mecanica_lamborghini`.`usuario` (`TipoUser`, `Nome`, `CPF`, `Celular`, `email`, `Login`, `Senha`) VALUES ('User', 'Cliente', '33333333333', '47988888888', 'nathan@teste.com', 'nathan', '123');
INSERT INTO `mecanica_lamborghini`.`usuario` (`TipoUser`, `Nome`, `CPF`, `Celular`, `email`, `Login`, `Senha`) VALUES ('User', 'Cliente', '44444444444', '47977777777', 'carlos@teste.com', 'carlos', '123');
INSERT INTO `mecanica_lamborghini`.`usuario` (`TipoUser`, `Nome`, `CPF`, `Celular`, `email`, `Login`, `Senha`) VALUES ('User', 'Cliente', '55555555555', '47966666666', 'max@teste.com', 'max', '123');

INSERT INTO `mecanica_lamborghini`.`carro` (`Modelo`, `Cor`, `Placa`, `Ano`, `Marca`, `idusuario`) VALUES ('Lamborghini Aventador', 'Roxo', 'DEF1D23', '2023', 'Lamborghini', '1');
INSERT INTO `mecanica_lamborghini`.`carro` (`Modelo`, `Cor`, `Placa`, `Ano`, `Marca`, `idusuario`) VALUES ('Peugeot 208', 'Vermelho', 'GHI1D23', '2008', 'Peuget', '2');
INSERT INTO `mecanica_lamborghini`.`carro` (`Modelo`, `Cor`, `Placa`, `Ano`, `Marca`, `idusuario`) VALUES ('Gol G6', 'Branco', 'ABC1D23', '2014', 'Volkswagen', '3');
INSERT INTO `mecanica_lamborghini`.`carro` (`Modelo`, `Cor`, `Placa`, `Ano`, `Marca`, `idusuario`) VALUES ('Sandero', 'Prata', 'JKL1D23', '2012', 'Renault', '4');
INSERT INTO `mecanica_lamborghini`.`carro` (`Modelo`, `Cor`, `Placa`, `Ano`, `Marca`, `idusuario`) VALUES ('Corsa', 'Preto', 'ZYW1D23', '2000', 'Chevrolet', '5');

INSERT INTO `mecanica_lamborghini`.`servico` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Elétrico', '100', 'Hora');
INSERT INTO `mecanica_lamborghini`.`servico` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Manual', '50', 'Hora');
INSERT INTO `mecanica_lamborghini`.`servico` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Reparo', '300', 'Hora');
INSERT INTO `mecanica_lamborghini`.`servico` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Preventiva', '1000', 'Hora');
INSERT INTO `mecanica_lamborghini`.`servico` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Pintura', '80', 'Hora');

INSERT INTO `mecanica_lamborghini`.`peca` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Farol', '200', 'Peça');
INSERT INTO `mecanica_lamborghini`.`peca` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Volante', '100', 'Unidade');
INSERT INTO `mecanica_lamborghini`.`peca` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Motor', '2000', 'Unidade');
INSERT INTO `mecanica_lamborghini`.`peca` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Óleo', '150', 'Litro');
INSERT INTO `mecanica_lamborghini`.`peca` (`Nome`, `ValorAtual`, `unMedida`) VALUES ('Tinta', '50', 'Litro');

INSERT INTO `mecanica_lamborghini`.`orcamento` (`TotalPeca`, `TotalServico`, `ValorTotal`, `Descricao`, `Status`, `idCarro`, `idUsuario`) VALUES ('300', '200', '500', 'Troca de farol', 'Serviço Concluído', '1', '1');
INSERT INTO `mecanica_lamborghini`.`orcamento` (`TotalPeca`, `TotalServico`, `ValorTotal`, `Descricao`, `Status`, `idCarro`, `idUsuario`) VALUES ('50', '100', '150', 'Troca de volante', 'Serviço Concluído', '1', '1');
INSERT INTO `mecanica_lamborghini`.`orcamento` (`TotalPeca`, `TotalServico`, `ValorTotal`, `Descricao`, `Status`, `idCarro`, `idUsuario`) VALUES ('50', '200', '250', 'Troca de volante', 'Serviço em Andamento', '2', '2');
INSERT INTO `mecanica_lamborghini`.`orcamento` (`TotalPeca`, `TotalServico`, `ValorTotal`, `Descricao`, `Status`, `idCarro`, `idUsuario`) VALUES ('50', '150', '200', 'Troca de óleo', 'Pré-Orçamento', '3', '3');
INSERT INTO `mecanica_lamborghini`.`orcamento` (`TotalPeca`, `TotalServico`, `ValorTotal`, `Descricao`, `Status`, `idCarro`, `idUsuario`) VALUES ('240', '100', '340', 'Pintura do carro', 'Pré-Orçamento', '4', '4');
INSERT INTO `mecanica_lamborghini`.`orcamento` (`TotalPeca`, `TotalServico`, `ValorTotal`, `Descricao`, `Status`, `idCarro`, `idUsuario`) VALUES ('2000', '3000', '5000', 'Troca do motor', 'Aguardando aprovação do Cliente', '5', '5');

INSERT INTO `mecanica_lamborghini`.`ItemServico` (`Qnt`, `ValorUn`, `ValorTotal`, `idServico`, `idOrcamento`) VALUES ('3', '100', '300', '1', '1');
INSERT INTO `mecanica_lamborghini`.`ItemServico` (`Qnt`, `ValorUn`, `ValorTotal`, `idServico`, `idOrcamento`) VALUES ('1', '50', '50', '1', '1');
INSERT INTO `mecanica_lamborghini`.`ItemServico` (`Qnt`, `ValorUn`, `ValorTotal`, `idServico`, `idOrcamento`) VALUES ('1', '50', '50', '2', '2');
INSERT INTO `mecanica_lamborghini`.`ItemServico` (`Qnt`, `ValorUn`, `ValorTotal`, `idServico`, `idOrcamento`) VALUES ('1', '50', '50', '3', '3');
INSERT INTO `mecanica_lamborghini`.`ItemServico` (`Qnt`, `ValorUn`, `ValorTotal`, `idServico`, `idOrcamento`) VALUES ('3', '80', '240', '4', '4');	
INSERT INTO `mecanica_lamborghini`.`ItemServico` (`Qnt`, `ValorUn`, `ValorTotal`, `idServico`, `idOrcamento`) VALUES ('10', '300', '3000', '5', '5');																														
	
INSERT INTO `mecanica_lamborghini`.`ItemPeca` (`Qnt`, `ValorUn`, `ValorTotal`, `idPeca`, `idOrcamento`) VALUES ('1', '200', '200', '1', '1');
INSERT INTO `mecanica_lamborghini`.`ItemPeca` (`Qnt`, `ValorUn`, `ValorTotal`, `idPeca`, `idOrcamento`) VALUES ('1', '100', '100', '1', '1');
INSERT INTO `mecanica_lamborghini`.`ItemPeca` (`Qnt`, `ValorUn`, `ValorTotal`, `idPeca`, `idOrcamento`) VALUES ('1', '100', '100', '2', '2');
INSERT INTO `mecanica_lamborghini`.`ItemPeca` (`Qnt`, `ValorUn`, `ValorTotal`, `idPeca`, `idOrcamento`) VALUES ('1', '150', '150', '3', '3');
INSERT INTO `mecanica_lamborghini`.`ItemPeca` (`Qnt`, `ValorUn`, `ValorTotal`, `idPeca`, `idOrcamento`) VALUES ('2', '50', '100', '4', '4');
INSERT INTO `mecanica_lamborghini`.`ItemPeca` (`Qnt`, `ValorUn`, `ValorTotal`, `idPeca`, `idOrcamento`) VALUES ('1', '2000', '2000', '5', '5');