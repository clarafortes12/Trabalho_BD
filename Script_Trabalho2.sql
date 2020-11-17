-- MySQL Script generated by MySQL Workbench
-- Tue Nov 17 14:59:39 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Endereco` (
  `idTipo_Endereco` INT NOT NULL,
  `descricao_tipoendereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UF` (
  `idUF` INT NOT NULL,
  `nome_UF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUF`, `nome_UF`),
  UNIQUE INDEX `nome_UF_UNIQUE` (`nome_UF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `idCidade` INT NOT NULL,
  `nome_cidade` VARCHAR(45) NOT NULL,
  `DDD` INT NOT NULL,
  `UF_nome_UF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCidade`, `UF_nome_UF`),
  INDEX `fk_Cidade_UF1_idx` (`UF_nome_UF` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_UF1`
    FOREIGN KEY (`UF_nome_UF`)
    REFERENCES `mydb`.`UF` (`nome_UF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bairro` (
  `idBairro` INT NOT NULL,
  `nome_bairro` VARCHAR(45) NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idBairro`, `Cidade_idCidade`),
  UNIQUE INDEX `idBairro_UNIQUE` (`idBairro` ASC) VISIBLE,
  INDEX `fk_Bairro_Cidade1_idx` (`Cidade_idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Bairro_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `mydb`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL,
  `CEP` VARCHAR(8) NOT NULL,
  `nome_rua` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `numero_casa` INT NOT NULL,
  `Tipo_Endereco_idTipo_Endereco` INT NOT NULL,
  `UF_idUF` INT NOT NULL,
  `Bairro_idBairro` INT NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  `Bairro_idBairro1` INT NOT NULL,
  `Bairro_Cidade_idCidade` INT NOT NULL,
  `Bairro_Cidade_UF_idUF` INT NOT NULL,
  PRIMARY KEY (`idEndereco`, `Tipo_Endereco_idTipo_Endereco`, `UF_idUF`, `Bairro_idBairro`, `Cidade_idCidade`, `Bairro_idBairro1`, `Bairro_Cidade_idCidade`, `Bairro_Cidade_UF_idUF`),
  INDEX `fk_Endereco_Tipo_Endereco_idx` (`Tipo_Endereco_idTipo_Endereco` ASC) VISIBLE,
  INDEX `fk_Endereco_Bairro1_idx` (`Bairro_idBairro1` ASC, `Bairro_Cidade_idCidade` ASC, `Bairro_Cidade_UF_idUF` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Tipo_Endereco`
    FOREIGN KEY (`Tipo_Endereco_idTipo_Endereco`)
    REFERENCES `mydb`.`Tipo_Endereco` (`idTipo_Endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Bairro1`
    FOREIGN KEY (`Bairro_idBairro1` , `Bairro_Cidade_idCidade`)
    REFERENCES `mydb`.`Bairro` (`idBairro` , `Cidade_idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hospital` (
  `nome_hospital` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`cnpj`, `Endereco_idEndereco`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE,
  INDEX `fk_Hospital_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Hospital_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ala` (
  `cod_Ala` INT UNSIGNED NOT NULL,
  `Hospital_cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_Ala`, `Hospital_cnpj`),
  INDEX `fk_Ala_Hospital1_idx` (`Hospital_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Ala_Hospital1`
    FOREIGN KEY (`Hospital_cnpj`)
    REFERENCES `mydb`.`Hospital` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Telefone` (
  `idTipo_Telefone` INT NOT NULL,
  `descricao_tipotelefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_Telefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL,
  `numero_telefone` INT NOT NULL,
  `Tipo_Telefone_idTipo_Telefone` INT NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  `Cidade_UF_idUF` INT NOT NULL,
  PRIMARY KEY (`idTelefone`, `Tipo_Telefone_idTipo_Telefone`, `Cidade_idCidade`, `Cidade_UF_idUF`),
  INDEX `fk_Telefone_Tipo_Telefone1_idx` (`Tipo_Telefone_idTipo_Telefone` ASC) VISIBLE,
  INDEX `fk_Telefone_Cidade1_idx` (`Cidade_idCidade` ASC, `Cidade_UF_idUF` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Tipo_Telefone1`
    FOREIGN KEY (`Tipo_Telefone_idTipo_Telefone`)
    REFERENCES `mydb`.`Tipo_Telefone` (`idTipo_Telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `mydb`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enfermaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enfermaria` (
  `cod_Enfermaria` INT UNSIGNED NOT NULL,
  `descricao_enfermaria` MEDIUMTEXT NOT NULL,
  `Ala_cod_Ala` INT UNSIGNED NOT NULL,
  `Telefone_idTelefone` INT NOT NULL,
  PRIMARY KEY (`cod_Enfermaria`, `Ala_cod_Ala`, `Telefone_idTelefone`),
  UNIQUE INDEX `idEnfermarias_UNIQUE` (`cod_Enfermaria` ASC) VISIBLE,
  INDEX `fk_Enfermaria_Ala1_idx` (`Ala_cod_Ala` ASC) VISIBLE,
  INDEX `fk_Enfermaria_Telefone1_idx` (`Telefone_idTelefone` ASC) VISIBLE,
  CONSTRAINT `fk_Enfermaria_Ala1`
    FOREIGN KEY (`Ala_cod_Ala`)
    REFERENCES `mydb`.`Ala` (`cod_Ala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enfermaria_Telefone1`
    FOREIGN KEY (`Telefone_idTelefone`)
    REFERENCES `mydb`.`Telefone` (`idTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado_Civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estado_Civil` (
  `cod_EstadoCivil` INT NOT NULL,
  `descricao_estadocivil` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_EstadoCivil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sexo` (
  `cod_Sexo` INT NOT NULL,
  `descricao_sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_Sexo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa` (
  `CPF` INT UNSIGNED NOT NULL,
  `nome_pessoa` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `email` VARCHAR(45) NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `Estado_Civil_cod_EstadoCivil` INT NOT NULL,
  `Sexo_cod_Sexo` INT NOT NULL,
  `Telefone_idTelefone` INT NOT NULL,
  PRIMARY KEY (`CPF`, `Endereco_idEndereco`, `Estado_Civil_cod_EstadoCivil`, `Sexo_cod_Sexo`, `Telefone_idTelefone`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Pessoa_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  INDEX `fk_Pessoa_Estado_Civil1_idx` (`Estado_Civil_cod_EstadoCivil` ASC) VISIBLE,
  INDEX `fk_Pessoa_Sexo1_idx` (`Sexo_cod_Sexo` ASC) VISIBLE,
  INDEX `fk_Pessoa_Telefone1_idx` (`Telefone_idTelefone` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Estado_Civil1`
    FOREIGN KEY (`Estado_Civil_cod_EstadoCivil`)
    REFERENCES `mydb`.`Estado_Civil` (`cod_EstadoCivil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Sexo1`
    FOREIGN KEY (`Sexo_cod_Sexo`)
    REFERENCES `mydb`.`Sexo` (`cod_Sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Telefone1`
    FOREIGN KEY (`Telefone_idTelefone`)
    REFERENCES `mydb`.`Telefone` (`idTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipamento` (
  `cod_Equipamento` INT NOT NULL,
  `descricao_equipamento` VARCHAR(45) NULL,
  `fabricante` VARCHAR(45) NULL,
  `Enfermaria_cod_Enfermaria` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cod_Equipamento`, `Enfermaria_cod_Enfermaria`),
  INDEX `fk_Equipamento_Enfermaria1_idx` (`Enfermaria_cod_Enfermaria` ASC) VISIBLE,
  CONSTRAINT `fk_Equipamento_Enfermaria1`
    FOREIGN KEY (`Enfermaria_cod_Enfermaria`)
    REFERENCES `mydb`.`Enfermaria` (`cod_Enfermaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plano_Saude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plano_Saude` (
  `cod_PlanoSaude` INT NOT NULL,
  `descricao_planosaude` VARCHAR(45) NULL,
  `nome_planosaude` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_PlanoSaude`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `cod_Paciente` INT NOT NULL,
  `Plano_Saude_cod_PlanoSaude` INT NOT NULL,
  `Pessoa_CPF` INT UNSIGNED NOT NULL,
  `peso_paciente` FLOAT NULL,
  `altura_paciente` FLOAT NULL,
  PRIMARY KEY (`cod_Paciente`, `Plano_Saude_cod_PlanoSaude`, `Pessoa_CPF`),
  INDEX `fk_Paciente_Plano_Saude1_idx` (`Plano_Saude_cod_PlanoSaude` ASC) VISIBLE,
  INDEX `fk_Paciente_Pessoa1_idx` (`Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Plano_Saude1`
    FOREIGN KEY (`Plano_Saude_cod_PlanoSaude`)
    REFERENCES `mydb`.`Plano_Saude` (`cod_PlanoSaude`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `mydb`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `cod_Funcionario` INT NOT NULL,
  `salario` FLOAT NULL,
  `Pessoa_CPF` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cod_Funcionario`, `Pessoa_CPF`),
  INDEX `fk_Funcionario_Pessoa1_idx` (`Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `mydb`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medico` (
  `CRM` VARCHAR(45) NOT NULL,
  `titulacao` VARCHAR(45) NULL,
  `filiacao` VARCHAR(45) NULL,
  `Funcionario_cod_Funcionario` INT NOT NULL,
  PRIMARY KEY (`CRM`, `Funcionario_cod_Funcionario`),
  INDEX `fk_Medico_Funcionario1_idx` (`Funcionario_cod_Funcionario` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_Funcionario1`
    FOREIGN KEY (`Funcionario_cod_Funcionario`)
    REFERENCES `mydb`.`Funcionario` (`cod_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enfermeiro` (
  `COREN` VARCHAR(45) NOT NULL,
  `formacao_enfermeiro` VARCHAR(45) NULL,
  `Funcionario_cod_Funcionario` INT NOT NULL,
  PRIMARY KEY (`COREN`, `Funcionario_cod_Funcionario`),
  INDEX `fk_Enfermeiro_Funcionario1_idx` (`Funcionario_cod_Funcionario` ASC) VISIBLE,
  CONSTRAINT `fk_Enfermeiro_Funcionario1`
    FOREIGN KEY (`Funcionario_cod_Funcionario`)
    REFERENCES `mydb`.`Funcionario` (`cod_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Convenio` (
  `cod_TipoConvenio` INT NOT NULL,
  `descricao_tipoconvenio` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_TipoConvenio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Laboratorio` (
  `cod_Laboratorio` INT NOT NULL,
  `descricao_laboratorio` VARCHAR(45) NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `Endereco_Tipo_Endereco_idTipo_Endereco` INT NOT NULL,
  `Endereco_UF_idUF` INT NOT NULL,
  `Endereco_Bairro_idBairro` INT NOT NULL,
  `Endereco_Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`cod_Laboratorio`, `Endereco_idEndereco`, `Endereco_Tipo_Endereco_idTipo_Endereco`, `Endereco_UF_idUF`, `Endereco_Bairro_idBairro`, `Endereco_Cidade_idCidade`),
  INDEX `fk_Laboratorio_Endereco1_idx` (`Endereco_idEndereco` ASC, `Endereco_Tipo_Endereco_idTipo_Endereco` ASC, `Endereco_UF_idUF` ASC, `Endereco_Bairro_idBairro` ASC, `Endereco_Cidade_idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Laboratorio_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco` , `Endereco_Tipo_Endereco_idTipo_Endereco` , `Endereco_UF_idUF` , `Endereco_Bairro_idBairro` , `Endereco_Cidade_idCidade`)
    REFERENCES `mydb`.`Endereco` (`idEndereco` , `Tipo_Endereco_idTipo_Endereco` , `UF_idUF` , `Bairro_idBairro` , `Cidade_idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Convenio` (
  `cod_Convenio` INT NOT NULL,
  `descricao_convenio` VARCHAR(45) NULL,
  `valor_convenio` FLOAT NULL,
  `Tipo_Convenio_cod_TipoConvenio` INT NOT NULL,
  `Laboratorio_cod_Laboratorio` INT NOT NULL,
  `Hospital_cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_Convenio`, `Tipo_Convenio_cod_TipoConvenio`, `Laboratorio_cod_Laboratorio`, `Hospital_cnpj`),
  INDEX `fk_Convenio_Tipo_Convenio1_idx` (`Tipo_Convenio_cod_TipoConvenio` ASC) VISIBLE,
  INDEX `fk_Convenio_Laboratorio1_idx` (`Laboratorio_cod_Laboratorio` ASC) VISIBLE,
  INDEX `fk_Convenio_Hospital1_idx` (`Hospital_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Convenio_Tipo_Convenio1`
    FOREIGN KEY (`Tipo_Convenio_cod_TipoConvenio`)
    REFERENCES `mydb`.`Tipo_Convenio` (`cod_TipoConvenio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convenio_Laboratorio1`
    FOREIGN KEY (`Laboratorio_cod_Laboratorio`)
    REFERENCES `mydb`.`Laboratorio` (`cod_Laboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convenio_Hospital1`
    FOREIGN KEY (`Hospital_cnpj`)
    REFERENCES `mydb`.`Hospital` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `cod_Consulta` INT NOT NULL,
  `motivo` VARCHAR(45) NULL,
  `Medico_CRM` VARCHAR(45) NOT NULL,
  `Paciente_cod_Paciente` INT NOT NULL,
  `Paciente_Plano_Saude_cod_PlanoSaude` INT NOT NULL,
  PRIMARY KEY (`cod_Consulta`, `Medico_CRM`, `Paciente_cod_Paciente`, `Paciente_Plano_Saude_cod_PlanoSaude`),
  INDEX `fk_Consulta_Medico1_idx` (`Medico_CRM` ASC) VISIBLE,
  INDEX `fk_Consulta_Paciente1_idx` (`Paciente_cod_Paciente` ASC, `Paciente_Plano_Saude_cod_PlanoSaude` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Medico1`
    FOREIGN KEY (`Medico_CRM`)
    REFERENCES `mydb`.`Medico` (`CRM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Paciente1`
    FOREIGN KEY (`Paciente_cod_Paciente` , `Paciente_Plano_Saude_cod_PlanoSaude`)
    REFERENCES `mydb`.`Paciente` (`cod_Paciente` , `Plano_Saude_cod_PlanoSaude`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Exame` (
  `cod_Exame` INT NOT NULL,
  `descricao_exame` VARCHAR(45) NULL,
  `restricao_exame` VARCHAR(45) NULL,
  `Consulta_cod_Consulta` INT NOT NULL,
  `Consulta_Medico_CRM` VARCHAR(45) NOT NULL,
  `Consulta_Paciente_cod_Paciente` INT NOT NULL,
  `Consulta_Paciente_Plano_Saude_cod_PlanoSaude` INT NOT NULL,
  `Laboratorio_cod_Laboratorio` INT NOT NULL,
  `Enfermeiro_COREN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_Exame`, `Consulta_cod_Consulta`, `Consulta_Medico_CRM`, `Consulta_Paciente_cod_Paciente`, `Consulta_Paciente_Plano_Saude_cod_PlanoSaude`, `Laboratorio_cod_Laboratorio`, `Enfermeiro_COREN`),
  INDEX `fk_Exame_Consulta1_idx` (`Consulta_cod_Consulta` ASC, `Consulta_Medico_CRM` ASC, `Consulta_Paciente_cod_Paciente` ASC, `Consulta_Paciente_Plano_Saude_cod_PlanoSaude` ASC) VISIBLE,
  INDEX `fk_Exame_Laboratorio1_idx` (`Laboratorio_cod_Laboratorio` ASC) VISIBLE,
  INDEX `fk_Exame_Enfermeiro1_idx` (`Enfermeiro_COREN` ASC) VISIBLE,
  CONSTRAINT `fk_Exame_Consulta1`
    FOREIGN KEY (`Consulta_cod_Consulta` , `Consulta_Medico_CRM` , `Consulta_Paciente_cod_Paciente` , `Consulta_Paciente_Plano_Saude_cod_PlanoSaude`)
    REFERENCES `mydb`.`Consulta` (`cod_Consulta` , `Medico_CRM` , `Paciente_cod_Paciente` , `Paciente_Plano_Saude_cod_PlanoSaude`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exame_Laboratorio1`
    FOREIGN KEY (`Laboratorio_cod_Laboratorio`)
    REFERENCES `mydb`.`Laboratorio` (`cod_Laboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exame_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_COREN`)
    REFERENCES `mydb`.`Enfermeiro` (`COREN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependente` (
  `cod_Dependente` INT NOT NULL,
  `Pessoa_CPF` INT UNSIGNED NOT NULL,
  `Funcionario_cod_Funcionario` INT NOT NULL,
  `Funcionario_Pessoa_CPF` INT UNSIGNED NOT NULL,
  `tipo_dependente` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_Dependente`, `Pessoa_CPF`, `Funcionario_cod_Funcionario`, `Funcionario_Pessoa_CPF`),
  INDEX `fk_Dependente_Pessoa1_idx` (`Pessoa_CPF` ASC) VISIBLE,
  INDEX `fk_Dependente_Funcionario1_idx` (`Funcionario_cod_Funcionario` ASC, `Funcionario_Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `mydb`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dependente_Funcionario1`
    FOREIGN KEY (`Funcionario_cod_Funcionario` , `Funcionario_Pessoa_CPF`)
    REFERENCES `mydb`.`Funcionario` (`cod_Funcionario` , `Pessoa_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hospital_has_Enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hospital_has_Enfermeiro` (
  `Hospital_cnpj` VARCHAR(45) NOT NULL,
  `Enfermeiro_COREN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Hospital_cnpj`, `Enfermeiro_COREN`),
  INDEX `fk_Hospital_has_Enfermeiro_Enfermeiro1_idx` (`Enfermeiro_COREN` ASC) VISIBLE,
  INDEX `fk_Hospital_has_Enfermeiro_Hospital1_idx` (`Hospital_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Hospital_has_Enfermeiro_Hospital1`
    FOREIGN KEY (`Hospital_cnpj`)
    REFERENCES `mydb`.`Hospital` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospital_has_Enfermeiro_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_COREN`)
    REFERENCES `mydb`.`Enfermeiro` (`COREN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hospital_has_Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hospital_has_Medico` (
  `Hospital_cnpj` VARCHAR(45) NOT NULL,
  `Medico_CRM` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Hospital_cnpj`, `Medico_CRM`),
  INDEX `fk_Hospital_has_Medico_Medico1_idx` (`Medico_CRM` ASC) VISIBLE,
  INDEX `fk_Hospital_has_Medico_Hospital1_idx` (`Hospital_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Hospital_has_Medico_Hospital1`
    FOREIGN KEY (`Hospital_cnpj`)
    REFERENCES `mydb`.`Hospital` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospital_has_Medico_Medico1`
    FOREIGN KEY (`Medico_CRM`)
    REFERENCES `mydb`.`Medico` (`CRM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Receita` (
  `idReceita` INT NOT NULL,
  `data_receita` VARCHAR(45) NULL,
  `Consulta_cod_Consulta` INT NOT NULL,
  `Consulta_Medico_CRM` VARCHAR(45) NOT NULL,
  `Consulta_Paciente_cod_Paciente` INT NOT NULL,
  `Consulta_Paciente_Plano_Saude_cod_PlanoSaude` INT NOT NULL,
  PRIMARY KEY (`idReceita`, `Consulta_cod_Consulta`, `Consulta_Medico_CRM`, `Consulta_Paciente_cod_Paciente`, `Consulta_Paciente_Plano_Saude_cod_PlanoSaude`),
  INDEX `fk_Receita_Médica_Consulta1_idx` (`Consulta_cod_Consulta` ASC, `Consulta_Medico_CRM` ASC, `Consulta_Paciente_cod_Paciente` ASC, `Consulta_Paciente_Plano_Saude_cod_PlanoSaude` ASC) VISIBLE,
  CONSTRAINT `fk_Receita_Médica_Consulta1`
    FOREIGN KEY (`Consulta_cod_Consulta` , `Consulta_Medico_CRM` , `Consulta_Paciente_cod_Paciente` , `Consulta_Paciente_Plano_Saude_cod_PlanoSaude`)
    REFERENCES `mydb`.`Consulta` (`cod_Consulta` , `Medico_CRM` , `Paciente_cod_Paciente` , `Paciente_Plano_Saude_cod_PlanoSaude`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Remedio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Remedio` (
  `idRemedio` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `dias_uso` TIME NULL,
  `intervalo_uso` VARCHAR(45) NULL,
  `nome_remedio` VARCHAR(45) NULL,
  `Receita_idReceita` INT NOT NULL,
  `Receita_Consulta_cod_Consulta` INT NOT NULL,
  `Receita_Consulta_Medico_CRM` VARCHAR(45) NOT NULL,
  `Receita_Consulta_Paciente_cod_Paciente` INT NOT NULL,
  PRIMARY KEY (`idRemedio`, `Receita_idReceita`, `Receita_Consulta_cod_Consulta`, `Receita_Consulta_Medico_CRM`, `Receita_Consulta_Paciente_cod_Paciente`),
  INDEX `fk_Remedio_Receita1_idx` (`Receita_idReceita` ASC, `Receita_Consulta_cod_Consulta` ASC, `Receita_Consulta_Medico_CRM` ASC, `Receita_Consulta_Paciente_cod_Paciente` ASC) VISIBLE,
  CONSTRAINT `fk_Remedio_Receita1`
    FOREIGN KEY (`Receita_idReceita` , `Receita_Consulta_cod_Consulta` , `Receita_Consulta_Medico_CRM` , `Receita_Consulta_Paciente_cod_Paciente`)
    REFERENCES `mydb`.`Receita` (`idReceita` , `Consulta_cod_Consulta` , `Consulta_Medico_CRM` , `Consulta_Paciente_cod_Paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
