-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503
USE hospital;

CALL alterar_uf(1, 'Distrito Federal');
CALL alterar_uf(2, 'Ceara');
CALL alterar_uf(3, 'Pernambuco');

CALL alterar_cidade(1, 'São Paulo', 62, 0);
CALL alterar_cidade(2, 'Brasília', 61, 2);
CALL alterar_cidade(3, '', 0, 1);

CALL alterar_bairro(1, 'Guara', 0);
CALL alterar_bairro(2, 'Asa Norte', 0);
CALL alterar_bairro(3, '', 2);

CALL alterar_tipo_endereco(1, '');
CALL alterar_tipo_endereco(2, 'Residencia');

CALL alterar_endereco(1, '71915001', '', '', 0, 1, 1);
CALL alterar_endereco(2, '', '', 'Bloco y apt 2', 1, 1, 1);
CALL alterar_endereco(1, '', '', '', 0, 1, 0);
    
CALL alterar_hospital('11111111111111', '', 'Hospital Teresinopolis', 0);
CALL alterar_hospital('22222222222222', '22222222222221' , '', 0);
CALL alterar_hospital('33333333333333', '', '', 1);

CALL alterar_ala(1, 'Ala da Clinica Geral', '');
CALL alterar_ala(2, '', '11111111111111');
CALL alterar_ala(3, 'Ala da Pediatria', '11111111111111');

CALL alterar_tipo_convenio(1,'convenio laboratorial sanquineo');
CALL alterar_tipo_convenio(2, 'convenio laboratorial cardiologico');
CALL alterar_tipo_convenio(3, 'convenio laboratorial radiologico');

CALL alterar_sexo (1, 'feminino');
CALL alterar_sexo (2, 'masculino');

CALL alterar_plano_saude(1, '', 'Bradesco Saude');
CALL alterar_plano_saude(2, 'Plano Hospitalar Brasileiro', '');
CALL alterar_plano_saude(3, 'FUSEX', 'Plano Hospitalar do Exercito');

CALL alterar_estado_civil(1, 'casado');
CALL alterar_estado_civil(2, 'divorciado');
CALL alterar_estado_civil(3, 'solteiro');

CALL alterar_telefone(1, '', 2, 1);
CALL alterar_telefone(2, '61998989893', 1, 0);
CALL alterar_telefone(3, '', 1, 0);

CALL alterar_enfermaria(1, '', 1, 1);
CALL alterar_enfermaria(2, '', 1, 1);
CALL alterar_enfermaria(3, 'Oftalmologia', 1, 1);

CALL alterar_laboratorio(1, 'Sabin 3', 0);
CALL alterar_laboratorio(2, '', 1);
CALL alterar_laboratorio(3, 'Sabin 1', 1);

CALL alterar_convenio(1, '', 900000, 0, 0, '');
CALL alterar_convenio(2, '', 0, 0, 0, '11111111111111');
CALL alterar_convenio(3, 'Convenio de xxx e yyy', 0, 0, 0, '');

CALL alterar_equipamento(1, '', '', 1);
CALL alterar_equipamento(2, '', 'Joao', 1);
CALL alterar_equipamento(3, 'Desfibrilador 154556143', '', 1);

CALL alterar_pessoa('03503503555', '03503503550', '', '0000-00-00','', 0, 0, 0, 0);
CALL alterar_pessoa('03503503554', '', 'Joao Pedro', '0000-00-00','', 0, 0, 0, 0);
CALL alterar_pessoa('03503503554', '', '', '1995-11-08','', 0, 0, 0, 0);

CALL alterar_paciente(1, 2, 0, 0);
CALL alterar_paciente(2, 0, 98.8, 0);
CALL alterar_paciente(3, 0, 0, 1.90);

CALL alterar_funcionario(1, 151654.89);
CALL alterar_funcionario(2, 151654.89);
CALL alterar_funcionario(3, 151654.89);

CALL alterar_dependente(1, 'filho', 0);
CALL alterar_dependente(2, '', 1);
CALL alterar_dependente(3, 'filha', 4);

CALL alterar_medico('00000FF', '00000FE', '', '', 0);
CALL alterar_medico('00000FG', '', 'doutor em cardiologia', '', 0);
CALL alterar_medico('00000FH', '', '', 'filiado ao hospital xx', 0);

CALL alterar_enfermeiro('00000FK', '00000FR', '', 3);
CALL alterar_enfermeiro('00000FL', '', 'formado em harvard', 0);
CALL alterar_enfermeiro('00000FM', '', '', 1);

CALL alterar_consulta(1, 'dor no peito', '', 0 , 0);
CALL alterar_consulta(2, '', '00000FH', 0 , 0);
CALL alterar_consulta(3, '', '', 0 , 3);

CALL alterar_receita(1, '0000-00-00', 3);
CALL alterar_receita(2, '2020-11-23', 0);
CALL alterar_receita(3, '2020-11-24', 3);

CALL alterar_exame(1, 'Exame de gravidez', '', '' , 0, 0);
CALL alterar_exame(2, '', 'Alergia a ovo', '00000FL', 0, 0);
CALL alterar_exame(3, '', '', '', 0, 0);

CALL alterar_remedio(1, 'Remedio de dor de cabeça', 0 , '', '', 0);
CALL alterar_remedio(2, '', 60 , '', '', 0);
CALL alterar_remedio(3, '', 0 , '1 por dia', 'DORFLEX', 0);