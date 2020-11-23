-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

USE hospital;
/*INSERT INTO uf (nome_UF) VALUES 
('Santa Amaro');
INSERT INTO cidade (nome_cidade, DDD, UF_idUF) VALUES 
('Santa Maria', 66, 1);
INSERT INTO bairro (nome_bairro, Cidade_idCidade) VALUES 
('Santa Maria', 1);
INSERT INTO tipo_endereco (descricao_tipoendereco) VALUES 
('Residencial');
INSERT INTO endereco (CEP, nome_rua, complemento, numero_casa, Tipo_Endereco_IdTipo_Endereco,Bairro_idBairro) VALUES 
('70673530', 'rua','bloco x',1,1,1);
INSERT INTO hospital (nome_hospital, cnpj, Endereco_idEndereco) VALUES 
('Santa Maria', '12345678912345',1);
INSERT INTO ala (descricao_Ala, Hospital_cnpj) VALUES 
('ala_norte','12345678912345');*/

DROP PROCEDURE alterar_uf;
DROP PROCEDURE alterar_cidade;
DROP PROCEDURE alterar_bairro;
DROP PROCEDURE alterar_tipo_endereco;
DROP PROCEDURE alterar_endereco;

CREATE PROCEDURE alterar_uf(IN id int, In nome varchar(45))
	UPDATE uf SET nome_UF = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_UF
        END
    WHERE idUF = id;

CREATE PROCEDURE alterar_cidade(IN id int, In nome varchar(45), IN ddd_valor int, IN id_uf int)
	UPDATE cidade SET nome_cidade = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_cidade
        END, 
        DDD = CASE 
			WHEN ddd_valor > 0 THEN ddd_valor
            ELSE DDD
        END,
        UF_idUF = CASE 
			WHEN id_uf > 0 THEN id_uf
            ELSE UF_idUF
        END
        WHERE idCidade = id;
        
CREATE PROCEDURE alterar_bairro(IN id int, In nome varchar(45), IN id_cidade int)
	UPDATE bairro SET nome_bairro = 
		CASE 
			WHEN nome <> '' THEN nome
            ELSE nome_bairro
        END, 
        Cidade_idCidade = CASE 
			WHEN id_cidade > 0 THEN id_cidade
            ELSE Cidade_idCidade
        END
        WHERE idBairro = id;

CREATE PROCEDURE alterar_tipo_endereco(IN id int, In descricao varchar(45))
	UPDATE uf SET descricao_tipoendereco = 
		CASE 
			WHEN descricao <> '' THEN descricao
            ELSE descricao_tipoendereco
        END
    WHERE idTipo_Endereco = id;
    
CREATE PROCEDURE alterar_endereco(IN id int, In cep_valor varchar(8), In rua varchar(45), 
	In comple varchar(45), In casa int, IN idTipo int, IN idBairro int)
	UPDATE endereco SET CEP = 
		CASE 
			WHEN cep_valor <> '' THEN cep_valor
            ELSE CEP
        END, 
        nome_rua = CASE 
			WHEN rua <> '' THEN rua
            ELSE nome_rua
        END,
        complemento = CASE 
			WHEN comple <> '' THEN comple
            ELSE complemento
        END,
        numero_casa = CASE 
			WHEN casa > 0 THEN casa
            ELSE numero_casa
        END,
        Tipo_Endereco_idTipo_Endereco = CASE 
			WHEN idTipo > 0 THEN idTipo
            ELSE Tipo_Endereco_idTipo_Endereco
        END,
        Bairro_idBairro = CASE 
			WHEN idBairro > 0 THEN idBairro
            ELSE Bairro_idBairro
        END
        WHERE idEndereco = id;
CREATE PROCEDURE alterar_hospital(IN id int, IN nome varchar(8), IN rua varchar(45), IN idEndereco int)
	SELECT * from hospital;
    
/*CREATE PROCEDURE alterar_ala()
	SELECT * from ala;
CREATE PROCEDURE alterar_consulta()
	SELECT * from consulta;
CREATE PROCEDURE alterar_convenio()
	SELECT * from convenio;
CREATE PROCEDURE alterar_dependente()
	SELECT * from dependente;
CREATE PROCEDURE alterar_enfermaria()
	SELECT * from enfermaria;
CREATE PROCEDURE alterar_enfermeiro()
	SELECT * from enfermeiro;
CREATE PROCEDURE alterar_equipamento()
	SELECT * from equipamento;
CREATE PROCEDURE alterar_estado_civil()
	SELECT * from estado_civil;
CREATE PROCEDURE alterar_exame()
	SELECT * from exame;
CREATE PROCEDURE alterar_funcionario()
	SELECT * from funcionario;
CREATE PROCEDURE alterar_laboratorio()
	SELECT * from laboratorio;
CREATE PROCEDURE alterar_medico()
	SELECT * from medico;
CREATE PROCEDURE alterar_paciente()
	SELECT * from paciente;
CREATE PROCEDURE alterar_plano_saude()
	SELECT * from plano_saude;
CREATE PROCEDURE alterar_receita()
	SELECT * from receita;
CREATE PROCEDURE alterar_remedio()
	SELECT * from remedio;
CREATE PROCEDURE alterar_sexo()
	SELECT * from sexo;
CREATE PROCEDURE alterar_telefone()
	SELECT * from telefone;
CREATE PROCEDURE alterar_tipo_convenio()
	SELECT * from tipo_convenio;
CREATE PROCEDURE alterar_tipo_telefone()
	SELECT * from tipo_telefone;*/