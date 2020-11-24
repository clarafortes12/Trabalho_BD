-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503
USE hospital;

create procedure mostrar_enfermeiro()
	SELECT * FROM enfermeiro 
    INNER JOIN funcionario ON Funcionario_cod_Funcionario = cod_Funcionario
    INNER JOIN pessoa ON Pessoa_CPF = CPF;

create procedure mostrar_medico()
	SELECT * FROM medico 
    INNER JOIN funcionario ON Funcionario_cod_Funcionario = cod_Funcionario
    INNER JOIN pessoa ON Pessoa_CPF = CPF;

create procedure mostrar_convenio(IN cnpj_valor varchar(15))
	select * from convenio where Hospital_cnpj = cnpj_valor;

create procedure mostrar_pacientes_medico(IN CRM_valor varchar(45))
	SELECT paciente.*, pessoa.* 
    FROM exame
    INNER JOIN consulta ON Consulta_cod_Consulta = cod_Consulta
    INNER JOIN paciente ON Paciente_cod_Paciente = cod_Paciente
    INNER JOIN pessoa ON Pessoa_CPF = CPF
    WHERE Medico_CRM = CRM_valor;

create procedure mostrar_exames_pacientes(IN idPaciente int)
	SELECT exame.* FROM exame
    INNER JOIN consulta ON Consulta_cod_Consulta = cod_Consulta
    INNER JOIN paciente ON Paciente_cod_Paciente = cod_Paciente
    WHERE Paciente_cod_Paciente = idPaciente;

create procedure mostrar_laboratorios_hospital(IN cnpj_valor varchar(15))
	SELECT laboratorio.cod_Laboratorio, laboratorio.descricao_laboratorio AS laboratorio
    FROM convenio
    INNER JOIN laboratorio ON Laboratorio_cod_Laboratorio = cod_Laboratorio
    INNER JOIN hospital ON Hospital_cnpj = cnpj
    WHERE Hospital_cnpj = cnpj_valor;

create procedure mostrar_exame_laboratorio(in idLaboratorio int)
	SELECT * FROM exame WHERE Laboratorio_cod_Laboratorio = idLaboratorio;
