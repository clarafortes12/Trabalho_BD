-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

USE hospital;

CALL excluir_remedio(4);
CALL excluir_remedio(5);

CALL excluir_exame(4);
CALL excluir_exame(5);

CALL excluir_receita(4);
CALL excluir_receita(5);

CALL excluir_consulta(3);
CALL excluir_consulta(2);

CALL excluir_enfermeiro('00000FR');
CALL excluir_enfermeiro('00000FL');

CALL excluir_medico('00000FE');
CALL excluir_medico('00000FH');

CALL excluir_dependente(2);
CALL excluir_dependente(3);

CALL excluir_funcionario(2);
CALL excluir_funcionario(5);

CALL excluir_paciente(1);
CALL excluir_paciente(3);

CALL excluir_pessoa(2);
CALL excluir_pessoa(4);

CALL excluir_uf(3);
CALL excluir_uf(4);

CALL excluir_cidade(3);
CALL excluir_cidade(4);
        
CALL excluir_bairro(3);
CALL excluir_bairro(4);

CALL excluir_tipo_endereco(2);

CALL excluir_endereco(4);
CALL excluir_endereco(5);

CALL excluir_hospital('33333333333333');
CALL excluir_hospital('44444444444444');
        
CALL excluir_ala(4);
CALL excluir_ala(5);

CALL excluir_tipo_telefone(2);

CALL excluir_tipo_convenio(4);
CALL excluir_tipo_convenio(5);

CALL excluir_sexo (2);

CALL excluir_plano_saude(4);
CALL excluir_plano_saude(5);

CALL excluir_estado_civil(4);
CALL excluir_estado_civil(5);

CALL excluir_telefone(2);
CALL excluir_telefone(3);

CALL excluir_enfermaria(4);
CALL excluir_enfermaria(5);

CALL excluir_laboratorio(2);
CALL excluir_laboratorio(3);

CALL excluir_convenio(4);
CALL excluir_convenio(5);

CALL excluir_equipamento(4);
CALL excluir_equipamento(5);