
/*

Guilherme Romanholi Santos  RM: 557462

Igor Werneck Jacobosque     RM: 558395

Cristian Caja Rodrigues     RM: 558502

*/
 
-- DROP

drop table realiza cascade constraints;

drop table dirige cascade constraints;

drop table armazena cascade constraints;

drop table trabalha cascade constraints;

drop table possui cascade constraints;

drop table pedido_forma_pagamento cascade constraints;

drop table servico_realizado cascade constraints;

drop table motorista cascade constraints;

drop table endereco cascade constraints;

drop table mecanico cascade constraints;

drop table oficina cascade constraints;

drop table forma_pag cascade constraints;

drop table pedido cascade constraints;

drop table diagnostico cascade constraints;

drop table peca cascade constraints;

drop table carro cascade constraints;

drop table cliente cascade constraints;

drop table guincho cascade constraints;

alter session set NLS_DATE_FORMAT = 'dd-mm-yyyy';
 
-- CREATE guincho

create table guincho(

    chassi_gui varchar(18) constraint gui_chassi_pk primary key,

    marca_gui varchar(29) constraint gui_marca_nn not null,

    placa_gui varchar(7) constraint gui_placa_nn not null,

    ano_fab_gui number(4) constraint gui_ano_fab_nn not null

);
 
-- CREATE cliente

create table cliente(

    cpf_clie varchar(11) constraint clie_cpf_pk1 primary key,

    nome_clie varchar(60) constraint clie_nome_nn1 not null,

    email_clie varchar(60) constraint clie_email_nn1 not null,

    tel_clie varchar(20) constraint clie_tel_nn1 not null,

    chassi_gui varchar(18) constraint clie_chassi_gui_fk1 references guincho

);
 
-- CREATE carro

create table carro(

    placa_car varchar(7) constraint car_placa_pk1 primary key,

    cor_car varchar(49) constraint car_cor_nn1 not null,

    marca_car varchar(20) constraint car_marca_nn1 not null,

    modelo_car varchar(39) constraint car_modelo_nn1 not null,

    cpf_clie varchar(11) constraint car_cpf_clie_fk1 references cliente,

    chassi_gui varchar(18) constraint car_chassi_gui_fk references guincho

);
 
-- CREATE diagnostico

create table diagnostico(

    id_dia number(38) constraint dia_id_pk primary key,

    data_dia date constraint dia_data_nn not null,

    status_dia varchar(39) constraint dia_status_nn not null

);

-- CREATE peca

create table peca(
    id_peca number(10) constraint peca_id_pk primary key,
    
    nome_peca varchar(50) constraint peca_nome_nn not null,
    
    desc_peca varchar(200) constraint peca_desc_nn not null,
    
    preco_peca number(10,2) constraint peca_preco_nn not null
    
);
 
-- CREATE pedido

create table pedido(

    num_ped number(10) constraint ped_num_pk primary key,

    tipo_ped varchar(49) constraint ped_tipo_nn not null,

    data_ped date constraint ped_data_nn not null,

    cpf_clie varchar(11) constraint ped_cpf_clie_fk references cliente

);
 
-- CREATE forma_pag

create table forma_pag(

    id_fp number(10) constraint fp_id_pk primary key,

    data_fp date constraint fp_data_nn not null,

    status_fp varchar(39) constraint fp_status_nn not null,

    valor_fp number(10,2) constraint fp_valor_nn not null

);
 
-- CREATE oficina

create table oficina(

    cnpj_of varchar(14) constraint of_cnpj_pk primary key,

    nome_of varchar(60) constraint of_name_nn not null,

    razao_soc_of varchar(30) constraint of_soc_razao_nn not null,

    numero_of number(10) constraint of_numero_nn not null 

);
 
-- CREATE mecanico

create table mecanico(

    id_mec number(10) constraint mec_id_pk primary key,

    cargo_mec varchar(29) constraint mec_cargo_nn not null,

    nome_mec varchar(60) constraint mec_nome_nn not null

);
 
-- CREATE endereco

create table endereco(

    id_end number(38) constraint end_id_pk primary key,

    estado_end varchar(49) constraint end_estado_nn not null,

    numero_end number(10) constraint end_numero_nn not null,

    cidade_end varchar(49) constraint end_cidade_nn not null

);
 
-- CREATE motorista

create table motorista(

    id_mot number(10) constraint mot_id_pk primary key,

    cg_horaria varchar(29) constraint mot_cg_horaria_nn not null,

    salario_mot number(10,2) constraint mot_salario_nn not null,

    nome_mot varchar(50) constraint mot_nome_nn not null

);
 
-- CREATE realiza

create table realiza(

    cpf_clie varchar(11) constraint rea_cpf_clie_fk references cliente,

    id_dia number(38) constraint rea_id_dia_fk references diagnostico

);
 
-- CREATE dirige

create table dirige(

    id_mot number(10) constraint dir_id_mot_fk references motorista,

    chassi_gui varchar(18) constraint dir_chassi_gui_fk references guincho

);
 
-- CREATE armazena

create table armazena(

    placa_car varchar(7) constraint arm_placa_car_fk references carro,

    cnpj_of varchar(14) constraint arm_cnpj_of_fk references oficina

);
 
-- CREATE trabalha

create table trabalha(

    cnpj_of varchar(14) constraint tra_cnpj_of_fk references oficina,

    id_mec number(10) constraint tra_id_mec_fk references mecanico

);
 
-- CREATE possui

create table possui(

    cnpj_of varchar(14) constraint poss_cnpj_of_fk references oficina,

    id_end number(38) constraint poss_id_end_fk references endereco

);

-- CREATE pedido_forma_pagamento

create table pedido_forma_pagamento(

    num_ped number(10) constraint ped_fp_num_ped_fk references pedido,
    
    id_fp number(10) constraint ped_fp_id_fp_fk references forma_pag
    
);

-- CREATE servico_realizado

create table servico_realizado(

    id_serv number(10) constraint serv_id_pk primary key,
    
    desc_serv varchar(200) constraint serv_desc_serv_nn not null,
    
    valor_serv number(10, 2) constraint serv_valor_serv_nn not null,
    
    id_dia number(38) constraint serv_id_dia_fk references diagnostico,
    
    id_peca number(10) constraint serv_id_peca_nn references peca
);
 
-- INSERT guincho

INSERT INTO guincho VALUES ('ABC1234DEFG56789', 'Toyota', 'XYZ1234', 2015);
INSERT INTO guincho VALUES ('DEF5678HIJK12345', 'Ford', 'ABC5678', 2018);
INSERT INTO guincho VALUES ('GHI1234LMNO56789', 'Honda', 'LMN1234', 2020);
INSERT INTO guincho VALUES ('JKL5678PQRS12345', 'Chevrolet', 'RST5678', 2012);
INSERT INTO guincho VALUES ('MNO1234TUVW56789', 'Fiat', 'UVW1234', 2019);
INSERT INTO guincho VALUES ('PQR5678XYZA12345', 'Nissan', 'XYZ5678', 2017);
INSERT INTO guincho VALUES ('STU1234BCDE56789', 'Volkswagen', 'BCD1234', 2016);
INSERT INTO guincho VALUES ('VWX5678FGHI12345', 'Hyundai', 'FGH5678', 2021);
INSERT INTO guincho VALUES ('YZA1234JKLM56789', 'Renault', 'JKL1234', 2020);
INSERT INTO guincho VALUES ('BCD5678NOPQ12345', 'Mitsubishi', 'NOP5678', 2022);
INSERT INTO guincho VALUES ('BCD5678DEFG67890', 'Renault', 'XYZ9013', 2020);
INSERT INTO guincho VALUES ('EFG6789HIJK67890', 'Toyota', 'ABC9013', 2021);
INSERT INTO guincho VALUES ('FGH7890JKLM67890', 'Honda', 'LMN9013', 2019);
INSERT INTO guincho VALUES ('GHI8901NOPQ67890', 'Chevrolet', 'RST9013', 2022);
INSERT INTO guincho VALUES ('HIJ9012QRST67890', 'Fiat', 'UVW9013', 2018);
INSERT INTO guincho VALUES ('JKL0123UVWX67890', 'Nissan', 'XYZ6789', 2022);
INSERT INTO guincho VALUES ('LMN1234WXYZ67890', 'Volkswagen', 'BCD9013', 2020);
INSERT INTO guincho VALUES ('MNO2345ABCD67890', 'Hyundai', 'FGH9013', 2023);
INSERT INTO guincho VALUES ('NOP3456EFGH67890', 'Renault', 'JKL9013', 2020);
INSERT INTO guincho VALUES ('PQR4567JKLM67890', 'Mitsubishi', 'NOP9013', 2021);
 
SELECT * FROM guincho;
 
-- INSERT cliente

INSERT INTO cliente VALUES ('12345678901', 'João Silva', 'joao@gmail.com', '123456789', 'ABC1234DEFG56789');
INSERT INTO cliente VALUES ('23456789012', 'Maria Souza', 'maria@gmail.com', '234567890', 'DEF5678HIJK12345');
INSERT INTO cliente VALUES ('34567890123', 'Pedro Santos', 'pedro@gmail.com', '345678901', 'GHI1234LMNO56789');
INSERT INTO cliente VALUES ('45678901234', 'Ana Costa', 'ana@gmail.com', '456789012', 'JKL5678PQRS12345');
INSERT INTO cliente VALUES ('56789012345', 'Carlos Oliveira', 'carlos@gmail.com', '567890123', 'MNO1234TUVW56789');
INSERT INTO cliente VALUES ('67890123456', 'Paula Almeida', 'paula@gmail.com', '678901234', 'PQR5678XYZA12345');
INSERT INTO cliente VALUES ('78901234567', 'Rafael Lima', 'rafael@gmail.com', '789012345', 'STU1234BCDE56789');
INSERT INTO cliente VALUES ('89012345678', 'Camila Ferreira', 'camila@gmail.com', '890123456', 'VWX5678FGHI12345');
INSERT INTO cliente VALUES ('90123456789', 'Bruno Pereira', 'bruno@gmail.com', '901234567', 'YZA1234JKLM56789');
INSERT INTO cliente VALUES ('01234567890', 'Juliana Mendes', 'juliana@gmail.com', '012345678', 'BCD5678NOPQ12345');
INSERT INTO cliente VALUES ('11223344556', 'Ricardo Almeida', 'ricardo.almeida@gmail.com', '1122334455', 'ABC1234DEFG56789');
INSERT INTO cliente VALUES ('22334455667', 'Sofia Santos', 'sofia.santos@gmail.com', '2233445566', 'DEF5678HIJK12345');
INSERT INTO cliente VALUES ('33445566778', 'Felipe Lima', 'felipe.lima@gmail.com', '3344556677', 'GHI1234LMNO56789');
INSERT INTO cliente VALUES ('44556677889', 'Tatiane Costa', 'tatiane.costa@gmail.com', '4455667788', 'JKL5678PQRS12345');
INSERT INTO cliente VALUES ('55667788990', 'Marcos Ferreira', 'marcos.ferreira@gmail.com', '5566778899', 'MNO1234TUVW56789');
INSERT INTO cliente VALUES ('66778899001', 'Jessica Martins', 'jessica.martins@gmail.com', '6677889900', 'PQR5678XYZA12345');
INSERT INTO cliente VALUES ('77889900112', 'Thiago Rocha', 'thiago.rocha@gmail.com', '7788990011', 'STU1234BCDE56789');
INSERT INTO cliente VALUES ('88990011223', 'Camila Almeida', 'camila.almeida@gmail.com', '8899001122', 'VWX5678FGHI12345');
INSERT INTO cliente VALUES ('99001122334', 'Rafael Santos', 'rafael.santos@gmail.com', '9900112233', 'YZA1234JKLM56789');
INSERT INTO cliente VALUES ('10111213141', 'Lucas Oliveira', 'lucas.oliveira@gmail.com', '1011121314', 'BCD5678NOPQ12345');

 
SELECT * FROM cliente;
 
-- INSERT carro

INSERT INTO carro VALUES ('XYZ1234', 'Preto', 'Toyota', 'Corolla', '12345678901', 'ABC1234DEFG56789');
INSERT INTO carro VALUES ('ABC5678', 'Branco', 'Ford', 'Fiesta', '23456789012', 'DEF5678HIJK12345');
INSERT INTO carro VALUES ('LMN1234', 'Cinza', 'Honda', 'Civic', '34567890123', 'GHI1234LMNO56789');
INSERT INTO carro VALUES ('RST5678', 'Vermelho', 'Chevrolet', 'Onix', '45678901234', 'JKL5678PQRS12345');
INSERT INTO carro VALUES ('UVW1234', 'Azul', 'Fiat', 'Uno', '56789012345', 'MNO1234TUVW56789');
INSERT INTO carro VALUES ('XYZ5678', 'Prata', 'Nissan', 'Versa', '67890123456', 'PQR5678XYZA12345');
INSERT INTO carro VALUES ('BCD1234', 'Verde', 'Volkswagen', 'Golf', '78901234567', 'STU1234BCDE56789');
INSERT INTO carro VALUES ('FGH5678', 'Amarelo', 'Hyundai', 'HB20', '89012345678', 'VWX5678FGHI12345');
INSERT INTO carro VALUES ('JKL1234', 'Roxo', 'Renault', 'Sandero', '90123456789', 'YZA1234JKLM56789');
INSERT INTO carro VALUES ('NOP5678', 'Marrom', 'Mitsubishi', 'Outlander', '01234567890', 'BCD5678NOPQ12345');
INSERT INTO carro VALUES ('XYZ9013', 'Preto', 'Renault', 'Sandero', '11223344556', 'BCD5678DEFG67890');
INSERT INTO carro VALUES ('ABC9013', 'Branco', 'Toyota', 'Corolla', '22334455667', 'EFG6789HIJK67890');
INSERT INTO carro VALUES ('DEF9013', 'Cinza', 'Honda', 'Civic', '33445566778', 'FGH7890JKLM67890');
INSERT INTO carro VALUES ('GHI9013', 'Vermelho', 'Chevrolet', 'Onix', '44556677889', 'GHI8901NOPQ67890');
INSERT INTO carro VALUES ('JKL9013', 'Azul', 'Fiat', 'Uno', '55667788990', 'HIJ9012QRST67890');
INSERT INTO carro VALUES ('MNO9013', 'Prata', 'Nissan', 'Versa', '66778899001', 'JKL0123UVWX67890');
INSERT INTO carro VALUES ('PQR9013', 'Verde', 'Volkswagen', 'Golf', '77889900112', 'LMN1234WXYZ67890');
INSERT INTO carro VALUES ('STU9013', 'Amarelo', 'Hyundai', 'HB20', '88990011223', 'MNO2345ABCD67890');
INSERT INTO carro VALUES ('VWX9013', 'Roxo', 'Renault', 'Captur', '99001122334', 'NOP3456EFGH67890');
INSERT INTO carro VALUES ('YZA9013', 'Marrom', 'Mitsubishi', 'Outlander', '10111213141', 'PQR4567JKLM67890');

 
SELECT * FROM carro;
 
-- INSERT diagnostico

INSERT INTO diagnostico VALUES (1, TO_DATE('01-01-2024', 'DD-MM-YYYY'), 'Em andamento');
INSERT INTO diagnostico VALUES (2, TO_DATE('02-02-2024', 'DD-MM-YYYY'), 'Concluído');
INSERT INTO diagnostico VALUES (3, TO_DATE('03-03-2024', 'DD-MM-YYYY'), 'Aguardando peças');
INSERT INTO diagnostico VALUES (4, TO_DATE('04-04-2024', 'DD-MM-YYYY'), 'Em andamento');
INSERT INTO diagnostico VALUES (5, TO_DATE('05-05-2024', 'DD-MM-YYYY'), 'Cancelado');
INSERT INTO diagnostico VALUES (6, TO_DATE('06-06-2024', 'DD-MM-YYYY'), 'Concluído');
INSERT INTO diagnostico VALUES (7, TO_DATE('07-07-2024', 'DD-MM-YYYY'), 'Em andamento');
INSERT INTO diagnostico VALUES (8, TO_DATE('08-08-2024', 'DD-MM-YYYY'), 'Aguardando peças');
INSERT INTO diagnostico VALUES (9, TO_DATE('09-09-2024', 'DD-MM-YYYY'), 'Concluído');
INSERT INTO diagnostico VALUES (10, TO_DATE('10-10-2024', 'DD-MM-YYYY'), 'Cancelado');
INSERT INTO diagnostico VALUES (11, TO_DATE('21-09-2024', 'DD-MM-YYYY'), 'Em andamento');
INSERT INTO diagnostico VALUES (12, TO_DATE('22-10-2024', 'DD-MM-YYYY'), 'Concluído');
INSERT INTO diagnostico VALUES (13, TO_DATE('23-11-2024', 'DD-MM-YYYY'), 'Aguardando peças');
INSERT INTO diagnostico VALUES (14, TO_DATE('24-12-2024', 'DD-MM-YYYY'), 'Em andamento');
INSERT INTO diagnostico VALUES (15, TO_DATE('25-01-2025', 'DD-MM-YYYY'), 'Cancelado');
INSERT INTO diagnostico VALUES (16, TO_DATE('26-02-2025', 'DD-MM-YYYY'), 'Concluído');
INSERT INTO diagnostico VALUES (17, TO_DATE('27-03-2025', 'DD-MM-YYYY'), 'Em andamento');
INSERT INTO diagnostico VALUES (18, TO_DATE('28-04-2025', 'DD-MM-YYYY'), 'Aguardando peças');
INSERT INTO diagnostico VALUES (19, TO_DATE('29-05-2025', 'DD-MM-YYYY'), 'Concluído');
INSERT INTO diagnostico VALUES (20, TO_DATE('30-06-2025', 'DD-MM-YYYY'), 'Cancelado');
 
SELECT * FROM diagnostico;
 
-- INSERT pedido

INSERT INTO pedido VALUES (1, 'Serviço', TO_DATE('01-01-2024', 'DD-MM-YYYY'), '12345678901');
INSERT INTO pedido VALUES (2, 'Peça', TO_DATE('02-02-2024', 'DD-MM-YYYY'), '23456789012');
INSERT INTO pedido VALUES (3, 'Serviço', TO_DATE('03-03-2024', 'DD-MM-YYYY'), '34567890123');
INSERT INTO pedido VALUES (4, 'Peça', TO_DATE('04-04-2024', 'DD-MM-YYYY'), '45678901234');
INSERT INTO pedido VALUES (5, 'Serviço', TO_DATE('05-05-2024', 'DD-MM-YYYY'), '56789012345');
INSERT INTO pedido VALUES (6, 'Peça', TO_DATE('06-06-2024', 'DD-MM-YYYY'), '67890123456');
INSERT INTO pedido VALUES (7, 'Serviço', TO_DATE('07-07-2024', 'DD-MM-YYYY'), '78901234567');
INSERT INTO pedido VALUES (8, 'Peça', TO_DATE('08-08-2024', 'DD-MM-YYYY'), '89012345678');
INSERT INTO pedido VALUES (9, 'Serviço', TO_DATE('09-09-2024', 'DD-MM-YYYY'), '90123456789');
INSERT INTO pedido VALUES (10, 'Peça', TO_DATE('10-10-2024', 'DD-MM-YYYY'), '01234567890');
INSERT INTO pedido VALUES (11, 'Serviço', TO_DATE('01-07-2024', 'DD-MM-YYYY'), '11223344556');
INSERT INTO pedido VALUES (12, 'Peça', TO_DATE('02-08-2024', 'DD-MM-YYYY'), '22334455667');
INSERT INTO pedido VALUES (13, 'Serviço', TO_DATE('03-09-2024', 'DD-MM-YYYY'), '33445566778');
INSERT INTO pedido VALUES (14, 'Peça', TO_DATE('04-10-2024', 'DD-MM-YYYY'), '44556677889');
INSERT INTO pedido VALUES (15, 'Serviço', TO_DATE('05-11-2024', 'DD-MM-YYYY'), '55667788990');
INSERT INTO pedido VALUES (16, 'Peça', TO_DATE('06-12-2024', 'DD-MM-YYYY'), '66778899001');
INSERT INTO pedido VALUES (17, 'Serviço', TO_DATE('07-01-2025', 'DD-MM-YYYY'), '77889900112');
INSERT INTO pedido VALUES (18, 'Peça', TO_DATE('08-02-2025', 'DD-MM-YYYY'), '88990011223');
INSERT INTO pedido VALUES (19, 'Serviço', TO_DATE('09-03-2025', 'DD-MM-YYYY'), '99001122334');
INSERT INTO pedido VALUES (20, 'Peça', TO_DATE('10-04-2025', 'DD-MM-YYYY'), '10111213141');

SELECT * FROM pedido;
 
-- INSERT forma_pag

INSERT INTO forma_pag VALUES (1, TO_DATE('01-01-2024', 'DD-MM-YYYY'), 'Pago', 500.00);
INSERT INTO forma_pag VALUES (2, TO_DATE('02-02-2024', 'DD-MM-YYYY'), 'Pendente', 300.00);
INSERT INTO forma_pag VALUES (3, TO_DATE('03-03-2024', 'DD-MM-YYYY'), 'Cancelado', 0.00);
INSERT INTO forma_pag VALUES (4, TO_DATE('04-04-2024', 'DD-MM-YYYY'), 'Pago', 700.00);
INSERT INTO forma_pag VALUES (5, TO_DATE('05-05-2024', 'DD-MM-YYYY'), 'Pendente', 400.00);
INSERT INTO forma_pag VALUES (6, TO_DATE('06-06-2024', 'DD-MM-YYYY'), 'Pago', 600.00);
INSERT INTO forma_pag VALUES (7, TO_DATE('07-07-2024', 'DD-MM-YYYY'), 'Cancelado', 0.00);
INSERT INTO forma_pag VALUES (8, TO_DATE('08-08-2024', 'DD-MM-YYYY'), 'Pendente', 200.00);
INSERT INTO forma_pag VALUES (9, TO_DATE('09-09-2024', 'DD-MM-YYYY'), 'Pago', 800.00);
INSERT INTO forma_pag VALUES (10, TO_DATE('10-10-2024', 'DD-MM-YYYY'), 'Pendente', 100.00);
INSERT INTO forma_pag VALUES (11, TO_DATE('01-01-2025', 'DD-MM-YYYY'), 'Pago', 500.00);
INSERT INTO forma_pag VALUES (12, TO_DATE('02-02-2025', 'DD-MM-YYYY'), 'Pendente', 300.00);
INSERT INTO forma_pag VALUES (13, TO_DATE('03-03-2025', 'DD-MM-YYYY'), 'Cancelado', 0.00);
INSERT INTO forma_pag VALUES (14, TO_DATE('04-04-2025', 'DD-MM-YYYY'), 'Pago', 700.00);
INSERT INTO forma_pag VALUES (15, TO_DATE('05-05-2025', 'DD-MM-YYYY'), 'Pendente', 400.00);
INSERT INTO forma_pag VALUES (16, TO_DATE('06-06-2025', 'DD-MM-YYYY'), 'Pago', 600.00);
INSERT INTO forma_pag VALUES (17, TO_DATE('07-07-2025', 'DD-MM-YYYY'), 'Cancelado', 0.00);
INSERT INTO forma_pag VALUES (18, TO_DATE('08-08-2025', 'DD-MM-YYYY'), 'Pendente', 200.00);
INSERT INTO forma_pag VALUES (19, TO_DATE('09-09-2025', 'DD-MM-YYYY'), 'Pago', 800.00);
INSERT INTO forma_pag VALUES (20, TO_DATE('10-10-2025', 'DD-MM-YYYY'), 'Pendente', 100.00);
 
SELECT * FROM forma_pag;
 
-- INSERT oficina

INSERT INTO oficina VALUES ('12345678000199', 'Oficina do João', 'João Ltda', 100);
INSERT INTO oficina VALUES ('23456789000188', 'Oficina do Roberto', 'Maria Ltda', 101);
INSERT INTO oficina VALUES ('34567890000177', 'Oficina do Pedro', 'Pedro Ltda', 102);
INSERT INTO oficina VALUES ('45678900000166', 'Oficina da Ana', 'Ana Ltda', 103);
INSERT INTO oficina VALUES ('56789010000155', 'Oficina do Carlos', 'Carlos Ltda', 104);
INSERT INTO oficina VALUES ('67890120000144', 'Oficina da Paula', 'Paula Ltda', 105);
INSERT INTO oficina VALUES ('78901230000133', 'Oficina do Rafael', 'Rafael Ltda', 106);
INSERT INTO oficina VALUES ('89012340000122', 'Oficina da Camila', 'Camila Ltda', 107);
INSERT INTO oficina VALUES ('90123450000111', 'Oficina do Bruno', 'Bruno Ltda', 108);
INSERT INTO oficina VALUES ('01234560000100', 'Oficina da Juliana', 'Juliana Ltda', 109);
INSERT INTO oficina VALUES ('09876543000111', 'Oficina do Ricardo', 'Ricardo Ltda', 121);
INSERT INTO oficina VALUES ('98765432000122', 'Oficina da Sofia', 'Sofia Ltda', 122);
INSERT INTO oficina VALUES ('87654321000133', 'Oficina do Felipe', 'Felipe Ltda', 123);
INSERT INTO oficina VALUES ('76543210000144', 'Oficina da Tatiane', 'Tatiane Ltda', 124);
INSERT INTO oficina VALUES ('65432100000155', 'Oficina do Marcos', 'Marcos Ltda', 125);
INSERT INTO oficina VALUES ('54321000000166', 'Oficina da Jessica', 'Jessica Ltda', 126);
INSERT INTO oficina VALUES ('43210000000177', 'Oficina do Thiago', 'Thiago Ltda', 127);
INSERT INTO oficina VALUES ('32100000000188', 'Oficina da Camila', 'Camila Ltda', 128);
INSERT INTO oficina VALUES ('21000000000199', 'Oficina do Rafael', 'Rafael Ltda', 129);
INSERT INTO oficina VALUES ('10987654000100', 'Oficina do Lucas', 'Lucas Ltda', 130);
 
SELECT * FROM oficina;
 
-- INSERT mecanico

INSERT INTO mecanico VALUES (1, 'Chefe de Oficina', 'João Silva');
INSERT INTO mecanico VALUES (2, 'Mecânico', 'Pedro Souza');
INSERT INTO mecanico VALUES (3, 'Eletricista', 'Carlos Almeida');
INSERT INTO mecanico VALUES (4, 'Pintor', 'Rafael Lima');
INSERT INTO mecanico VALUES (5, 'Montador', 'Bruno Mendes');
INSERT INTO mecanico VALUES (6, 'Chefe de Oficina', 'Ana Oliveira');
INSERT INTO mecanico VALUES (7, 'Mecânico', 'Juliana Costa');
INSERT INTO mecanico VALUES (8, 'Eletricista', 'Paulo Ferreira');
INSERT INTO mecanico VALUES (9, 'Pintor', 'Camila Santos');
INSERT INTO mecanico VALUES (10, 'Montador', 'Fernando Lopes');
INSERT INTO mecanico VALUES (21, 'Chefe de Oficina', 'Ricardo Almeida');
INSERT INTO mecanico VALUES (22, 'Mecânico', 'Sofia Santos');
INSERT INTO mecanico VALUES (23, 'Eletricista', 'Felipe Lima');
INSERT INTO mecanico VALUES (24, 'Pintor', 'Tatiane Costa');
INSERT INTO mecanico VALUES (25, 'Montador', 'Marcos Ferreira');
INSERT INTO mecanico VALUES (26, 'Chefe de Oficina', 'Jessica Martins');
INSERT INTO mecanico VALUES (27, 'Mecânico', 'Thiago Rocha');
INSERT INTO mecanico VALUES (28, 'Eletricista', 'Larissa Alves');
INSERT INTO mecanico VALUES (29, 'Pintor', 'Gabriel Nunes');
INSERT INTO mecanico VALUES (30, 'Montador', 'Fernanda Pinto');
 
SELECT * FROM mecanico;
 
-- INSERT endereco

INSERT INTO endereco VALUES (1, 'São Paulo', 123, 'São Paulo');
INSERT INTO endereco VALUES (2, 'Rio de Janeiro', 456, 'Rio de Janeiro');
INSERT INTO endereco VALUES (3, 'Minas Gerais', 789, 'Belo Horizonte');
INSERT INTO endereco VALUES (4, 'Bahia', 101, 'Salvador');
INSERT INTO endereco VALUES (5, 'Paraná', 202, 'Curitiba');
INSERT INTO endereco VALUES (6, 'Santa Catarina', 303, 'Florianópolis');
INSERT INTO endereco VALUES (7, 'Rio Grande do Sul', 404, 'Porto Alegre');
INSERT INTO endereco VALUES (8, 'Pernambuco', 505, 'Recife');
INSERT INTO endereco VALUES (9, 'Ceará', 606, 'Fortaleza');
INSERT INTO endereco VALUES (10, 'Distrito Federal', 707, 'Brasília');
INSERT INTO endereco VALUES (11, 'São Paulo', 123, 'São Paulo');
INSERT INTO endereco VALUES (12, 'Rio de Janeiro', 456, 'Rio de Janeiro');
INSERT INTO endereco VALUES (13, 'Minas Gerais', 789, 'Belo Horizonte');
INSERT INTO endereco VALUES (14, 'Bahia', 101, 'Salvador');
INSERT INTO endereco VALUES (15, 'Paraná', 202, 'Curitiba');
INSERT INTO endereco VALUES (16, 'Santa Catarina', 303, 'Florianópolis');
INSERT INTO endereco VALUES (17, 'Rio Grande do Sul', 404, 'Porto Alegre');
INSERT INTO endereco VALUES (18, 'Pernambuco', 505, 'Recife');
INSERT INTO endereco VALUES (19, 'Ceará', 606, 'Fortaleza');
INSERT INTO endereco VALUES (20, 'Distrito Federal', 707, 'Brasília');
 
SELECT * FROM endereco;
 
-- INSERT motorista

INSERT INTO motorista VALUES (1, 'Horista', 3000.00, 'Pedro Almeida');
INSERT INTO motorista VALUES (2, 'Mensalista', 4000.00, 'Ana Oliveira');
INSERT INTO motorista VALUES (3, 'Horista', 3500.00, 'Carlos Silva');
INSERT INTO motorista VALUES (4, 'Mensalista', 4500.00, 'Juliana Costa');
INSERT INTO motorista VALUES (5, 'Horista', 3200.00, 'Rafael Lima');
INSERT INTO motorista VALUES (6, 'Mensalista', 4200.00, 'Bruno Pereira');
INSERT INTO motorista VALUES (7, 'Horista', 3100.00, 'Fernanda Souza');
INSERT INTO motorista VALUES (8, 'Mensalista', 4600.00, 'Lucas Ferreira');
INSERT INTO motorista VALUES (9, 'Horista', 3300.00, 'Mariana Rocha');
INSERT INTO motorista VALUES (10, 'Mensalista', 4800.00, 'Roberto Dias');
INSERT INTO motorista VALUES (21, 'Horista', 3500.00, 'Gustavo Lima');
INSERT INTO motorista VALUES (22, 'Mensalista', 4600.00, 'Fabiana Santos');
INSERT INTO motorista VALUES (23, 'Horista', 3700.00, 'Marcio Ribeiro');
INSERT INTO motorista VALUES (24, 'Mensalista', 4800.00, 'Fernanda Almeida');
INSERT INTO motorista VALUES (25, 'Horista', 3900.00, 'Vitor Hugo');
INSERT INTO motorista VALUES (26, 'Mensalista', 5000.00, 'Leticia Ferreira');
INSERT INTO motorista VALUES (27, 'Horista', 4100.00, 'Robson Oliveira');
INSERT INTO motorista VALUES (28, 'Mensalista', 5300.00, 'Cristiane Nunes');
INSERT INTO motorista VALUES (29, 'Horista', 4300.00, 'Cecilia Pinto');
INSERT INTO motorista VALUES (30, 'Mensalista', 5500.00, 'Diego Costa');
 
SELECT * FROM motorista;
 
 -- INSERT peca
 
INSERT INTO peca VALUES (1, 'Filtro de óleo', 'Filtro de óleo para motor', 30.00);
INSERT INTO peca VALUES (2, 'Pastilha de freio', 'Pastilha de freio dianteira', 150.00);
INSERT INTO peca VALUES (3, 'Correia dentada', 'Correia dentada para motor', 100.00);
INSERT INTO peca VALUES (4, 'Amortecedor', 'Amortecedor traseiro', 250.00);
INSERT INTO peca VALUES (5, 'Velas de ignição', 'Velas de ignição para motor', 40.00);
INSERT INTO peca VALUES (6, 'Disco de freio', 'Disco de freio dianteiro', 200.00);
INSERT INTO peca VALUES (7, 'Filtro de ar', 'Filtro de ar para motor', 35.00);
INSERT INTO peca VALUES (8, 'Bateria', 'Bateria automotiva 60Ah', 400.00);
INSERT INTO peca VALUES (9, 'Radiador', 'Radiador de arrefecimento', 500.00);
INSERT INTO peca VALUES (10, 'Pneu', 'Pneu 175/70 R14', 250.00);
INSERT INTO peca VALUES (11, 'Filtro de ar', 'Filtro de ar para motor', 30.00);
INSERT INTO peca VALUES (12, 'Pastilha de freio', 'Pastilha de freio traseira', 150.00);
INSERT INTO peca VALUES (13, 'Correia do alternador', 'Correia do alternador para motor', 100.00);
INSERT INTO peca VALUES (14, 'Amortecedor dianteiro', 'Amortecedor dianteiro', 250.00);
INSERT INTO peca VALUES (15, 'Velas de ignição', 'Velas de ignição de alta performance', 40.00);
INSERT INTO peca VALUES (16, 'Disco de freio traseiro', 'Disco de freio traseiro', 200.00);
INSERT INTO peca VALUES (17, 'Filtro de combustível', 'Filtro de combustível para motor', 35.00);
INSERT INTO peca VALUES (18, 'Bateria', 'Bateria automotiva 75Ah', 400.00);
INSERT INTO peca VALUES (19, 'Radiador', 'Radiador para arrefecimento', 500.00);
INSERT INTO peca VALUES (20, 'Pneu', 'Pneu 195/65 R15', 250.00);
 
SELECT * FROM peca;

-- INSERT realiza

INSERT INTO realiza VALUES ('12345678901', 1);
INSERT INTO realiza VALUES ('23456789012', 2);
INSERT INTO realiza VALUES ('34567890123', 3);
INSERT INTO realiza VALUES ('45678901234', 4);
INSERT INTO realiza VALUES ('56789012345', 5);
INSERT INTO realiza VALUES ('67890123456', 6);
INSERT INTO realiza VALUES ('78901234567', 7);
INSERT INTO realiza VALUES ('89012345678', 8);
INSERT INTO realiza VALUES ('90123456789', 9);
INSERT INTO realiza VALUES ('01234567890', 10);
INSERT INTO realiza VALUES ('11223344556', 11);
INSERT INTO realiza VALUES ('22334455667', 12);
INSERT INTO realiza VALUES ('33445566778', 13);
INSERT INTO realiza VALUES ('44556677889', 14);
INSERT INTO realiza VALUES ('55667788990', 15);
INSERT INTO realiza VALUES ('66778899001', 16);
INSERT INTO realiza VALUES ('77889900112', 17);
INSERT INTO realiza VALUES ('88990011223', 18);
INSERT INTO realiza VALUES ('99001122334', 19);
INSERT INTO realiza VALUES ('10111213141', 20);
 
SELECT * FROM realiza;
 
-- INSERT dirige

INSERT INTO dirige VALUES (1, 'ABC1234DEFG56789');
INSERT INTO dirige VALUES (2, 'DEF5678HIJK12345');
INSERT INTO dirige VALUES (3, 'GHI1234LMNO56789');
INSERT INTO dirige VALUES (4, 'JKL5678PQRS12345');
INSERT INTO dirige VALUES (5, 'MNO1234TUVW56789');
INSERT INTO dirige VALUES (6, 'PQR5678XYZA12345');
INSERT INTO dirige VALUES (7, 'STU1234BCDE56789');
INSERT INTO dirige VALUES (8, 'VWX5678FGHI12345');
INSERT INTO dirige VALUES (9, 'YZA1234JKLM56789');
INSERT INTO dirige VALUES (10, 'BCD5678NOPQ12345');
INSERT INTO dirige VALUES (21, 'BCD5678DEFG67890');
INSERT INTO dirige VALUES (22, 'EFG6789HIJK67890');
INSERT INTO dirige VALUES (23, 'FGH7890JKLM67890');
INSERT INTO dirige VALUES (24, 'GHI8901NOPQ67890');
INSERT INTO dirige VALUES (25, 'HIJ9012QRST67890');
INSERT INTO dirige VALUES (26, 'JKL0123UVWX67890');
INSERT INTO dirige VALUES (27, 'LMN1234WXYZ67890');
INSERT INTO dirige VALUES (28, 'MNO2345ABCD67890');
INSERT INTO dirige VALUES (29, 'NOP3456EFGH67890');
INSERT INTO dirige VALUES (30, 'PQR4567JKLM67890');

 
SELECT * FROM dirige;
 
-- INSERT armazena

INSERT INTO armazena VALUES ('XYZ1234', '12345678000199');
INSERT INTO armazena VALUES ('ABC5678', '23456789000188');
INSERT INTO armazena VALUES ('LMN1234', '34567890000177');
INSERT INTO armazena VALUES ('RST5678', '45678900000166');
INSERT INTO armazena VALUES ('UVW1234', '56789010000155');
INSERT INTO armazena VALUES ('XYZ5678', '67890120000144');
INSERT INTO armazena VALUES ('BCD1234', '78901230000133');
INSERT INTO armazena VALUES ('FGH5678', '89012340000122');
INSERT INTO armazena VALUES ('JKL1234', '90123450000111');
INSERT INTO armazena VALUES ('NOP5678', '01234560000100');
INSERT INTO armazena VALUES ('XYZ9013', '09876543000111');
INSERT INTO armazena VALUES ('ABC9013', '98765432000122');
INSERT INTO armazena VALUES ('DEF9013', '87654321000133');
INSERT INTO armazena VALUES ('GHI9013', '76543210000144');
INSERT INTO armazena VALUES ('JKL9013', '65432100000155');
INSERT INTO armazena VALUES ('MNO9013', '54321000000166');
INSERT INTO armazena VALUES ('PQR9013', '43210000000177');
INSERT INTO armazena VALUES ('STU9013', '32100000000188');
INSERT INTO armazena VALUES ('VWX9013', '21000000000199');
INSERT INTO armazena VALUES ('YZA9013', '10987654000100');
 
SELECT * FROM armazena;

-- INSERT trabalha

INSERT INTO trabalha VALUES ('12345678000199', 1);
INSERT INTO trabalha VALUES ('23456789000188', 2);
INSERT INTO trabalha VALUES ('34567890000177', 3);
INSERT INTO trabalha VALUES ('45678900000166', 4);
INSERT INTO trabalha VALUES ('56789010000155', 5);
INSERT INTO trabalha VALUES ('67890120000144', 6);
INSERT INTO trabalha VALUES ('78901230000133', 7);
INSERT INTO trabalha VALUES ('89012340000122', 8);
INSERT INTO trabalha VALUES ('90123450000111', 9);
INSERT INTO trabalha VALUES ('01234560000100', 10);
INSERT INTO trabalha VALUES ('09876543000111', 21);
INSERT INTO trabalha VALUES ('98765432000122', 22);
INSERT INTO trabalha VALUES ('87654321000133', 23);
INSERT INTO trabalha VALUES ('76543210000144', 24);
INSERT INTO trabalha VALUES ('65432100000155', 25);
INSERT INTO trabalha VALUES ('54321000000166', 26);
INSERT INTO trabalha VALUES ('43210000000177', 27);
INSERT INTO trabalha VALUES ('32100000000188', 28);
INSERT INTO trabalha VALUES ('21000000000199', 29);
INSERT INTO trabalha VALUES ('10987654000100', 30);
 
SELECT * FROM trabalha;
 
-- INSERT possui

INSERT INTO possui VALUES ('12345678000199', 1);
INSERT INTO possui VALUES ('23456789000188', 2);
INSERT INTO possui VALUES ('34567890000177', 3);
INSERT INTO possui VALUES ('45678900000166', 4);
INSERT INTO possui VALUES ('56789010000155', 5);
INSERT INTO possui VALUES ('67890120000144', 6);
INSERT INTO possui VALUES ('78901230000133', 7);
INSERT INTO possui VALUES ('89012340000122', 8);
INSERT INTO possui VALUES ('90123450000111', 9);
INSERT INTO possui VALUES ('01234560000100', 10);
INSERT INTO possui VALUES ('09876543000111', 11);
INSERT INTO possui VALUES ('98765432000122', 12);
INSERT INTO possui VALUES ('87654321000133', 13);
INSERT INTO possui VALUES ('76543210000144', 14);
INSERT INTO possui VALUES ('65432100000155', 15);
INSERT INTO possui VALUES ('54321000000166', 16);
INSERT INTO possui VALUES ('43210000000177', 17);
INSERT INTO possui VALUES ('32100000000188', 18);
INSERT INTO possui VALUES ('21000000000199', 19);
INSERT INTO possui VALUES ('10987654000100', 20);

SELECT * FROM possui;

-- INSERT pedido_forma_pagamento

INSERT INTO pedido_forma_pagamento VALUES (1, 1);
INSERT INTO pedido_forma_pagamento VALUES (2, 2);
INSERT INTO pedido_forma_pagamento VALUES (3, 3);
INSERT INTO pedido_forma_pagamento VALUES (4, 4);
INSERT INTO pedido_forma_pagamento VALUES (5, 5);
INSERT INTO pedido_forma_pagamento VALUES (6, 6);
INSERT INTO pedido_forma_pagamento VALUES (7, 7);
INSERT INTO pedido_forma_pagamento VALUES (8, 8);
INSERT INTO pedido_forma_pagamento VALUES (9, 9);
INSERT INTO pedido_forma_pagamento VALUES (10, 10);
INSERT INTO pedido_forma_pagamento VALUES (11, 11);
INSERT INTO pedido_forma_pagamento VALUES (12, 12);
INSERT INTO pedido_forma_pagamento VALUES (13, 13);
INSERT INTO pedido_forma_pagamento VALUES (14, 14);
INSERT INTO pedido_forma_pagamento VALUES (15, 15);
INSERT INTO pedido_forma_pagamento VALUES (16, 16);
INSERT INTO pedido_forma_pagamento VALUES (17, 17);
INSERT INTO pedido_forma_pagamento VALUES (18, 18);
INSERT INTO pedido_forma_pagamento VALUES (19, 19);
INSERT INTO pedido_forma_pagamento VALUES (20, 20); 
 
SELECT * FROM pedido_forma_pagamento;
 
 -- INSERT servico_realizado
 
INSERT INTO servico_realizado VALUES (1, 'Troca de óleo', 150.00, 1, 1);
INSERT INTO servico_realizado VALUES (2, 'Troca de pastilhas de freio', 250.00, 2, 2);
INSERT INTO servico_realizado VALUES (3, 'Troca de correia dentada', 300.00, 3, 3);
INSERT INTO servico_realizado VALUES (4, 'Substituição de amortecedor', 450.00, 4, 4);
INSERT INTO servico_realizado VALUES (5, 'Troca de velas de ignição', 100.00, 5, 5);
INSERT INTO servico_realizado VALUES (6, 'Substituição do disco de freio', 200.00, 6, 6);
INSERT INTO servico_realizado VALUES (7, 'Troca de filtro de ar', 50.00, 7, 7);
INSERT INTO servico_realizado VALUES (8, 'Instalação de bateria', 500.00, 8, 8);
INSERT INTO servico_realizado VALUES (9, 'Troca de radiador', 600.00, 9, 9);
INSERT INTO servico_realizado VALUES (10, 'Substituição de pneus', 800.00, 10, 10);
INSERT INTO servico_realizado VALUES (11, 'Troca de óleo', 150.00, 11, 11);
INSERT INTO servico_realizado VALUES (12, 'Troca de pastilhas de freio', 250.00, 12, 12);
INSERT INTO servico_realizado VALUES (13, 'Troca de correia dentada', 300.00, 13, 13);
INSERT INTO servico_realizado VALUES (14, 'Substituição de amortecedor', 450.00, 14, 14);
INSERT INTO servico_realizado VALUES (15, 'Troca de velas de ignição', 100.00, 15, 15);
INSERT INTO servico_realizado VALUES (16, 'Substituição do disco de freio', 200.00, 16, 16);
INSERT INTO servico_realizado VALUES (17, 'Troca de filtro de ar', 50.00, 17, 17);
INSERT INTO servico_realizado VALUES (18, 'Instalação de bateria', 500.00, 18, 18);
INSERT INTO servico_realizado VALUES (19, 'Troca de radiador', 600.00, 19, 19);
INSERT INTO servico_realizado VALUES (20, 'Substituição de pneus', 800.00, 20, 20);
 
SELECT * FROM servico_realizado;

-- RELÁTORIOS

select cpf_clie "CPF", nome_clie "NOME" from cliente order by nome_clie asc;
select placa_car "PLACA", marca_car "MARCA" from carro order by placa_car asc;
select chassi_gui "CHASSI", marca_gui "MARCA", placa_gui "PLACA", ano_fab_gui "ANO" from guincho order by ano_fab_gui desc;
select id_end "ID", numero_end "NUMERO" ,estado_end "ESTADO" from endereco where estado_end in ('São Paulo', 'Rio de Janeiro', 'Minas Gerais');
 
select * from motorista where salario_mot >= 4000;
select * from servico_realizado where valor_serv >= 300 and valor_serv <= 800;
select avg(preco_peca) "MEDIA DAS PEÇAS" from peca;
select count(cpf_clie) "CLIENTES" from cliente;
select count(placa_car) "CARROS" from carro;
select sum(salario_mot) "SALARIO TOTAL" from motorista;
select max(valor_fp) "MAIOR VALOR PAGO" from forma_pag;
select min(valor_fp) "MENOR VALOR PAGO" from forma_pag;

select status_dia, count(id_dia) AS total_diagnosticos from diagnostico group by status_dia;
select guincho.marca_gui, count(cliente.cpf_clie) as total_clientes from guincho inner join cliente on guincho.chassi_gui = cliente.chassi_gui group by guincho.marca_gui;

select nome_mec "NOME DOS MECANICOS" from mecanico where id_mec in ( select trabalha.id_mec from trabalha inner join oficina on trabalha.cnpj_of = oficina.cnpj_of where oficina.nome_of like 'Oficina do %');
select nome_clie "NOME", email_clie "EMAIL" from cliente where cpf_clie in ( select cpf_clie from carro where cor_car = 'Vermelho');

select cliente.nome_clie, diagnostico.status_dia, diagnostico.data_dia from cliente inner join realiza on cliente.cpf_clie = realiza.cpf_clie inner join diagnostico on realiza.id_dia = diagnostico.id_dia;
select servico_realizado.id_serv, servico_realizado.desc_serv, servico_realizado.valor_serv, peca.nome_peca from servico_realizado inner join peca on servico_realizado.id_peca = peca.id_peca;

-- COMMIT

COMMIT;
