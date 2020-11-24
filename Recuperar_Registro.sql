-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

use hospital;

create procedure recuperar_uf(in id int)
	select * from UF where idUF=id;

create procedure recuperar_cidade(in id int)
	select * from Cidade where idCidade=id;

create procedure recuperar_bairro(in id int)
	select * from Bairro where idBairro=id;

create procedure recuperar_tipo_endereco(in id int)
	select * from Tipo_Endereco where idTipo_Endereco=id;

create procedure recuperar_endereco(in id int)
	select * from Endereco where idEndereco=id;

create procedure recuperar_hospital(in cnpj varchar(15))
	select * from Hospital where cnpj=cnpj;

create procedure recuperar_ala(in id int)
	select * from Ala where cod_Ala=id;

create procedure recuperar_tipo_telefone(in id int)
	select * from Tipo_Telefone where idTipo_Telefone=id;

create procedure recuperar_tipo_convenio(in id int)
	select * from Tipo_Convenio where cod_TipoConvenio=id;

create procedure recuperar_sexo(in id int)
	select * from Sexo where cod_Sexo=id;

create procedure recuperar_plano_saude(in id int)
	select * from Plano_Saude where cod_PlanoSaude=id;

create procedure recuperar_estado_civil(in id int)
	select * from Estado_Civil where cod_EstadoCivil=id;

create procedure recuperar_telefone(in id int)
	select * from Telefone where idTelefone=id;

create procedure recuperar_enfermaria(in id int)
	select * from Enfermaria where cod_Enfermaria=id;

create procedure recuperar_laboratorio(in id int)
	select * from Laboratorio where cod_Laboratorio=id;

create procedure recuperar_convenio(in id int)
	select * from Convenio where cod_Convenio=id;

create procedure recuperar_equipamento(in id int)
	select * from Equipamento where cod_Equipamento=id;

create procedure recuperar_pessoa(in cpf varchar(12))
	select * from Pessoa where CPF=cpf;

create procedure recuperar_paciente(in id int)
	select * from Paciente where cod_Paciente=id;

create procedure recuperar_funcionario(in id int)
	select * from Funcionario where cod_Funcionario=id;

create procedure recuperar_dependente (in id int)
	select * from Dependente where cod_Dependente=id;

create procedure recuperar_medico(in crm varchar(45))
	select * from Medico where CRM=crm;

create procedure recuperar_enfermeiro(in coren varchar(45))
	select * from Enfermeiro where COREN=coren;

create procedure recuperar_consulta(in id int)
	select * from Consulta where cod_Consulta=id;

create procedure recuperar_receita(in id int)
	select * from Receita where idReceita=id;

create procedure recuperar_exame(in id int)
	select * from Exame where cod_Exame=id;

create procedure recuperar_remedio(in id int)
	select * from Remedio where idRemedio=id;