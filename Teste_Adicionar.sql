-- Autores: 
--     Lucas Gabriel de Oliveira Gurgel - 19/0121637 
--     Maria Clara Oliveira Fortes - 19/0017503

use hospital;

call adicionar_uf('DF');
call adicionar_uf('CE');
call adicionar_uf('PE');
call adicionar_uf('PB');
call adicionar_uf('PI');

call adicionar_cidade('Brasília', 61, 1);
call adicionar_cidade('Sobradinho', 61, 1);
call adicionar_cidade('Fortaleza', 85, 2);
call adicionar_cidade('Teresina', 86, 2);
call adicionar_cidade('Picos', 86, 5);

call adicionar_bairro('Asa Norte', 1);
call adicionar_bairro('Asa Sul', 1);
call adicionar_bairro('Cruzeiro', 1);
call adicionar_bairro('Mucuripe', 2);
call adicionar_bairro('São Cristóvão', 5);


call adicionar_tipo_endereco('Comercial');
call adicionar_tipo_endereco('Residencial');

call adicionar_endereco('71915000', '911 Norte','Setor Hospitalar',1, 1, 1);
call adicionar_endereco('70673530', 'SRI2-HFA','Bloco x apt 1',1, 2, 1);
call adicionar_endereco('64055290', 'Orlando Carvalho','Perto da Paroquia',1, 2, 5);
call adicionar_endereco('64055290', 'Orlando Carvalho','Perto da Paroquia',1, 1, 5);
call adicionar_endereco('71915000', '911 Norte','Setor Hospitalar',85, 1, 1);

call adicionar_hospital('Hospital Teresina', '11111111111111', 4);
call adicionar_hospital('Hospital Santo', '22222222222222', 1);
call adicionar_hospital('Hospital São Jorge', '33333333333333', 1);
call adicionar_hospital('hospital Nacional', '44444444444444', 1);
call adicionar_hospital('hospital São Jose', '55555555555555', 5);

call adicionar_ala('Ala Clinica', '22222222222222');
call adicionar_ala('Ala Cirurgica', '22222222222222');
call adicionar_ala('Ala Pediatrica', '22222222222222');
call adicionar_ala('Ala Radiologica', '22222222222222');
call adicionar_ala('Ala Emergencial', '22222222222222');

call adicionar_tipo_telefone('Comercial');
call adicionar_tipo_telefone('Residencial');

call adicionar_tipo_convenio('convenio laboratorial cardiologico');
call adicionar_tipo_convenio('convenio laboratorial radiologico');
call adicionar_tipo_convenio('convenio laboratorial clinico');
call adicionar_tipo_convenio('convenio laboratorial de cancer');
call adicionar_tipo_convenio('convenio laboratorial de genetica');

call adicionar_sexo('masculino');
call adicionar_sexo('feminino');

call adicionar_plano_saude('Plano Hospitalar Bradesco', 'Bradesco');
call adicionar_plano_saude('Plano Hospitalar Banco do Brasil', 'Banco do Brasil');
call adicionar_plano_saude('Plano Hospitalar do Exercito', 'FUSEX');
call adicionar_plano_saude('Plano Hospitalar da Marinha', 'FUSMA');
call adicionar_plano_saude('Plano Hospitalar da Aeronaltica', 'SARAM');

call adicionar_estado_civil('solteito');
call adicionar_estado_civil('casado');
call adicionar_estado_civil('divorciado');
call adicionar_estado_civil('viuvo');
call adicionar_estado_civil('namorando');

call adicionar_telefone('61998989898', 1, 1);
call adicionar_telefone('61998989897', 1, 1);
call adicionar_telefone('61998989896', 1, 1);
call adicionar_telefone('61998989895', 1, 2);
call adicionar_telefone('61998989894', 1, 2);

call adicionar_enfermaria('Pediatria', 3, 1);
call adicionar_enfermaria('Cardiologia', 1, 2);
call adicionar_enfermaria('Emergência', 4, 2);
call adicionar_enfermaria('Dermatologia', 1, 1);
call adicionar_enfermaria('Genecologia', 1, 1);

call adicionar_laboratorio('Sabin 1', 1);
call adicionar_laboratorio('Sabin 2', 1);
call adicionar_laboratorio('Sabin 3', 1);
call adicionar_laboratorio('Sabin 4', 5);
call adicionar_laboratorio('Sabin 5', 5);

call adicionar_convenio('Descricao convenio 1', 180000, 1, 1,'22222222222222');
call adicionar_convenio('Descricao convenio 1', 80000, 1, 1,'22222222222222');
call adicionar_convenio('Descricao convenio 1', 9000, 1, 1,'22222222222222');
call adicionar_convenio('Descricao convenio 1', 10000, 1, 1,'22222222222222');
call adicionar_convenio('Descricao convenio 1', 100000, 1, 1,'22222222222222');


call adicionar_equipamento('Desfibrilador 154556149', 'Lucas', 1);
call adicionar_equipamento('Desfibrilador 154556148', 'Lucas', 1);
call adicionar_equipamento('Desfibrilador 154556147', 'Lucas', 1);
call adicionar_equipamento('Desfibrilador 154556146', 'Lucas', 1);
call adicionar_equipamento('Desfibrilador 154556145', 'Lucas', 1);

call adicionar_pessoa('03503503555', 'Lucas', '1995-12-08', 'lucas@gmail.com', 2, 1, 1, 1);
call adicionar_pessoa('03503503554', 'Joao', '1995-12-08', 'joao@gmail.com', 2, 2, 1, 1);
call adicionar_pessoa('03503503553', 'Joana', '1995-12-08', 'joana@gmail.com', 2, 2, 2, 1);
call adicionar_pessoa('03503503552', 'Maria', '1995-12-08', 'maria@gmail.com', 2, 2, 2, 1);
call adicionar_pessoa('03503503551', 'Ana', '1995-12-08', 'ana@gmail.com', 2, 1, 2, 1);

call adicionar_paciente(1, 1.67, 80, '03503503555');
call adicionar_paciente(1, 1.67, 80, '03503503554');
call adicionar_paciente(1, 1.67, 80, '03503503553');
call adicionar_paciente(1, 1.67, 80, '03503503552');
call adicionar_paciente(1, 1.67, 80, '03503503551');

call adicionar_funcionario(15000, '03503503555');
call adicionar_funcionario(15000, '03503503554');
call adicionar_funcionario(15000, '03503503553');
call adicionar_funcionario(15000, '03503503552');
call adicionar_funcionario(15000, '03503503551');

call adicionar_dependente('pai', '03503503554', 1);
call adicionar_dependente('esposa', '03503503553', 1);
call adicionar_dependente('filho', '03503503555', 1);
call adicionar_dependente('filha', '03503503552', 1);
call adicionar_dependente('mae', '03503503551', 1);

call adicionar_medico('00000FF', 'titulo', 'filiacao', 1);
call adicionar_medico('00000FG', 'titulo', 'filiacao', 2);
call adicionar_medico('00000FH', 'titulo', 'filiacao', 3);
call adicionar_medico('00000FI', 'titulo', 'filiacao', 4);
call adicionar_medico('00000FJ', 'titulo', 'filiacao', 5);

call adicionar_enfermeiro('00000FK', 'graduacao', 2);
call adicionar_enfermeiro('00000FL', 'graduacao', 2);
call adicionar_enfermeiro('00000FM', 'graduacao', 2);
call adicionar_enfermeiro('00000FN', 'graduacao', 4);
call adicionar_enfermeiro('00000FO', 'graduacao', 4);

call adicionar_consulta('Rotina', '00000FF', 2, 1);
call adicionar_consulta('Rotina', '00000FF', 2, 1);
call adicionar_consulta('Rotina', '00000FF', 2, 1);
call adicionar_consulta('Rotina', '00000FF', 2, 1);
call adicionar_consulta('Rotina', '00000FF', 2, 1);

call adicionar_receita('2020-12-08', 1);
call adicionar_receita('2020-11-08', 2);
call adicionar_receita('2020-10-08', 3);
call adicionar_receita('2020-09-08', 4);
call adicionar_receita('2020-08-08', 5);

call adicionar_exame('Exame Sangue xxx','Sem Restrição', 1, 1, '00000FK');
call adicionar_exame('Exame Sangue yyy','Sem Restrição', 1, 1, '00000FK');
call adicionar_exame('Exame Sangue www','Sem Restrição', 1, 1, '00000FK');
call adicionar_exame('Exame Sangue jjj','Sem Restrição', 1, 1, '00000FK');
call adicionar_exame('Exame Sangue kkk','Sem Restrição', 1, 1, '00000FK');

call adicionar_remedio('Bula info', 15, '12h', 'Paracetamol', 1);
call adicionar_remedio('Bula info', 30, '12h', 'Paracetamol', 2);
call adicionar_remedio('Bula info', 45, '12h', 'Paracetamol', 3);
call adicionar_remedio('Bula info', 60, '12h', 'Paracetamol', 4);
call adicionar_remedio('Bula info', 80, '12h', 'Paracetamol', 5);