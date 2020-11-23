-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

USE hospital;

CREATE PROCEDURE recuperar_ala()
	SELECT * from ala;
CREATE PROCEDURE recuperar_bairro()
	SELECT * from bairro;
CREATE PROCEDURE recuperar_cidade()
	SELECT * from cidade;
CREATE PROCEDURE recuperar_consulta()
	SELECT * from consulta;
CREATE PROCEDURE recuperar_convenio()
	SELECT * from convenio;
CREATE PROCEDURE recuperar_dependente()
	SELECT * from dependente;
CREATE PROCEDURE recuperar_endereco()
	SELECT * from endereco;
CREATE PROCEDURE recuperar_enfermaria()
	SELECT * from enfermaria;
CREATE PROCEDURE recuperar_enfermeiro()
	SELECT * from enfermeiro;
CREATE PROCEDURE recuperar_equipamento()
	SELECT * from equipamento;
CREATE PROCEDURE recuperar_estado_civil()
	SELECT * from estado_civil;
CREATE PROCEDURE recuperar_exame()
	SELECT * from exame;
CREATE PROCEDURE recuperar_funcionario()
	SELECT * from funcionario;
CREATE PROCEDURE recuperar_hospital()
	SELECT * from hospital;
CREATE PROCEDURE recuperar_laboratorio()
	SELECT * from laboratorio;
CREATE PROCEDURE recuperar_medico()
	SELECT * from medico;
CREATE PROCEDURE recuperar_paciente()
	SELECT * from paciente;
CREATE PROCEDURE recuperar_plano_saude()
	SELECT * from plano_saude;
CREATE PROCEDURE recuperar_receita()
	SELECT * from receita;
CREATE PROCEDURE recuperar_remedio()
	SELECT * from remedio;
CREATE PROCEDURE recuperar_sexo()
	SELECT * from sexo;
CREATE PROCEDURE recuperar_telefone()
	SELECT * from telefone;
CREATE PROCEDURE recuperar_tipo_convenio()
	SELECT * from tipo_convenio;
CREATE PROCEDURE recuperar_tipo_endereco()
	SELECT * from tipo_endereco;
CREATE PROCEDURE recuperar_tipo_telefone()
	SELECT * from tipo_telefone;
CREATE PROCEDURE recuperar_uf()
	SELECT * from uf;
