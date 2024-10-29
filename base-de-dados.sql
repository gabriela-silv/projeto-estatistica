CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    data_demissao DATE,
    salario DECIMAL(10, 2) NOT NULL,
    departamento VARCHAR(50)
);


CREATE TABLE historico_contratacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    evento ENUM('contratacao', 'demissao') NOT NULL,
    data_evento DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);


INSERT INTO funcionario (nome, data_contratacao, data_demissao, salario, departamento) VALUES
( 'João Silva', '2010-02-15', NULL, 3500.00, 'Vendas'),
( 'Maria Oliveira', '2011-06-10', NULL, 4200.00, 'Marketing'),
( 'Carlos Souza', '2012-04-23', '2015-03-12', 2800.00, 'Financeiro'),
( 'Ana Lima', '2013-09-14', NULL, 3800.00, 'RH'),
( 'Pedro Santos', '2014-11-25', NULL, 5000.00, 'TI'),
( 'Fernanda Costa', '2015-01-08', '2019-07-20', 3300.00, 'Vendas'),
( 'Lucas Ribeiro', '2016-03-30', NULL, 2500.00, 'Financeiro'),
( 'Mariana Fernandes', '2017-07-05', '2020-11-30', 3100.00, 'TI'),
( 'Rafael Almeida', '2018-08-22', NULL, 4700.00, 'Marketing'),
( 'Juliana Martins', '2019-12-01', NULL, 3700.00, 'RH'),
( 'Vinícius Mendes', '2020-01-20', NULL, 3600.00, 'TI'),
( 'Carla Figueiredo', '2020-02-15', NULL, 2900.00, 'Financeiro'),
( 'Roberto Silva', '2020-03-10', NULL, 4100.00, 'Vendas'),
( 'Larissa Rocha', '2020-04-05', NULL, 2700.00, 'Marketing'),
( 'Henrique Costa', '2020-05-22', '2023-01-15', 3200.00, 'RH'),
( 'Tatiana Almeida', '2020-06-10', NULL, 3500.00, 'TI'),
( 'Renato Moura', '2020-07-01', NULL, 2500.00, 'Vendas'),
( 'Aline Souza', '2020-08-18', NULL, 4800.00, 'Financeiro'),
( 'Felipe Andrade', '2020-09-29', NULL, 5000.00, 'TI'),
( 'Gustavo Teixeira', '2020-10-20', NULL, 3000.00, 'RH'),
( 'Tiago Ferreira', '2020-11-01', '2021-10-15', 3300.00, 'Vendas'),
( 'Isabela Santos', '2020-11-10', NULL, 2900.00, 'Marketing'),
( 'Fábio Almeida', '2020-11-15', NULL, 4000.00, 'TI'),
( 'Camila Oliveira', '2020-11-20', '2022-02-28', 3100.00, 'RH'),
( 'Juliano Nascimento', '2020-12-01', NULL, 3600.00, 'Financeiro'),
( 'Roberta Costa', '2021-01-10', NULL, 3800.00, 'Vendas'),
( 'Marcos Aurélio', '2021-01-15', '2023-04-15', 2900.00, 'Marketing'),
( 'Priscila Andrade', '2021-01-20', NULL, 3100.00, 'TI'),
( 'Diego Martins', '2021-01-25', NULL, 3400.00, 'RH'),
( 'Rafael Gonçalves', '2021-02-05', NULL, 3600.00, 'Vendas'),
( 'Tatiane Lima', '2021-02-10', NULL, 3700.00, 'Marketing'),
( 'Rodrigo Lima', '2021-02-15', NULL, 4200.00, 'TI'),
( 'Jessica Pires', '2021-02-20', NULL, 3100.00, 'RH'),
( 'Luciano Barros', '2021-02-25', '2023-01-30', 2600.00, 'Financeiro'),
( 'Aline Teixeira', '2021-03-01', NULL, 2800.00, 'Vendas'),
( 'Bruno Silva', '2021-03-05', NULL, 3200.00, 'Marketing'),
( 'Nathália Costa', '2021-03-10', NULL, 3300.00, 'TI'),
( 'Guilherme Sousa', '2021-03-15', '2022-05-15', 3100.00, 'RH'),
( 'Fernanda Ribeiro', '2021-03-20', NULL, 4500.00, 'Financeiro'),
( 'Rogério Martins', '2021-03-25', NULL, 2800.00, 'Vendas'),
( 'Talita Ramos', '2021-04-01', NULL, 3000.00, 'Marketing'),
( 'Ricardo Vieira', '2021-04-05', NULL, 2900.00, 'TI'),
( 'Sofia Almeida', '2021-04-10', NULL, 3400.00, 'RH'),
( 'Gabriel Nascimento', '2021-04-15', NULL, 3700.00, 'Financeiro'),
( 'Renan Ferreira', '2021-04-20', NULL, 2600.00, 'Vendas'),
( 'Mariana Oliveira', '2021-05-01', NULL, 3800.00, 'Marketing'),
( 'Lucia Santos', '2021-05-05', NULL, 3900.00, 'TI'),
( 'Pedro Lima', '2021-05-10', NULL, 3100.00, 'RH'),
( 'Amanda Rocha', '2021-05-15', NULL, 3000.00, 'Financeiro'),
( 'Vinícius Teixeira', '2021-05-20', NULL, 3500.00, 'Vendas'),
( 'Cláudio Almeida', '2021-06-01', NULL, 2700.00, 'Marketing'),
( 'Tatiane Martins', '2021-06-05', NULL, 2900.00, 'TI'),
( 'Thiago Ferreira', '2021-06-10', NULL, 4000.00, 'RH'),
( 'Jéssica Oliveira', '2021-06-15', NULL, 4200.00, 'Financeiro'),
( 'Adriana Costa', '2021-06-20', NULL, 3100.00, 'Vendas'),
( 'Eduardo Souza', '2021-07-01', NULL, 2800.00, 'Marketing'),
( 'Lara Lima', '2021-07-05', NULL, 3700.00, 'TI'),
( 'Gustavo Almeida', '2021-07-10', '2023-02-15', 3300.00, 'RH'),
( 'Patrícia Silva', '2021-07-15', NULL, 3600.00, 'Financeiro'),
( 'Alberto Santos', '2021-07-20', NULL, 2900.00, 'Vendas'),
( 'André Ferreira', '2021-08-01', NULL, 3800.00, 'Marketing'),
( 'Natália Costa', '2021-08-05', NULL, 4000.00, 'TI'),
( 'Marcel Silva', '2021-08-10', NULL, 3100.00, 'RH'),
( 'Renata Oliveira', '2021-08-15', '2023-03-01', 3000.00, 'Financeiro'),
( 'Marcio Santos', '2021-08-20', NULL, 2900.00, 'Vendas'),
( 'Leonardo Ferreira', '2021-09-01', NULL, 3700.00, 'Marketing'),
( 'Camila Almeida', '2021-09-05', NULL, 3800.00, 'TI'),
( 'Felipe Nascimento', '2021-09-10', NULL, 4200.00, 'RH'),
( 'Samantha Lima', '2021-09-15', NULL, 3100.00, 'Financeiro'),
( 'Carlos Eduardo', '2021-09-20', NULL, 3600.00, 'Vendas'),
( 'Bianca Costa', '2021-09-25', '2023-06-30', 3900.00, 'Marketing'),
( 'Julio Santos', '2021-10-01', NULL, 4500.00, 'TI'),
( 'Fernanda Almeida', '2021-10-05', NULL, 3300.00, 'RH'),
( 'Alexandre Pires', '2021-10-10', NULL, 3700.00, 'Financeiro'),
( 'Eliane Ferreira', '2021-10-15', NULL, 3100.00, 'Vendas'),
( 'Robson Lima', '2021-10-20', NULL, 3200.00, 'Marketing');



INSERT INTO historico_contratacao (evento, data_evento, salario)
VALUES 
('contratacao', '2010-02-15', 3500.00),
('contratacao', '2011-06-10', 4200.00),
('demissao', '2015-03-12', 2800.00),
('contratacao', '2013-09-14', 3800.00),
('contratacao', '2014-11-25', 5000.00),
('demissao', '2019-07-20', 3300.00),
('contratacao', '2016-03-30', 2500.00),
('demissao', '2020-11-30', 3100.00),
('contratacao', '2018-08-22', 4700.00),
('contratacao', '2019-12-01', 3700.00),
('demissao', '2021-07-15', 4100.00),
('contratacao', '2020-04-20', 3200.00),
('contratacao', '2020-06-05', 3500.00),
('demissao', '2022-08-10', 3500.00),
('contratacao', '2020-07-01', 2500.00),
('contratacao', '2020-08-15', 4800.00),
('contratacao', '2020-09-29', 5000.00),
('demissao', '2021-10-15', 3000.00),
('contratacao', '2021-11-11', 4100.00),
('demissao', '2022-02-15', 4100.00),
('contratacao', '2021-01-01', 3800.00),
('demissao', '2023-01-30', 3800.00),
('contratacao', '2023-03-15', 3900.00),
('contratacao', '2023-05-01', 3000.00),
('demissao', '2023-06-25', 3000.00),
('contratacao', '2023-08-30', 4500.00),
('contratacao', '2024-01-10', 3700.00),
('demissao', '2024-03-20', 3700.00),
('contratacao', '2024-04-01', 4600.00),
('contratacao', '2024-05-15', 4800.00),
('demissao', '2024-06-30', 4500.00),
('contratacao', '2024-07-10', 4300.00),
('contratacao', '2024-08-15', 4000.00),
('contratacao', '2024-09-05', 4100.00),
('demissao', '2024-10-20', 4000.00),
('contratacao', '2025-01-01', 4200.00),
('contratacao', '2025-02-14', 3900.00),
('contratacao', '2025-03-30', 4600.00),
('contratacao', '2025-04-15', 4700.00),
('demissao', '2025-05-20', 3900.00),
('contratacao', '2025-06-25', 4200.00),
('contratacao', '2025-07-10', 4800.00),
('contratacao', '2025-08-05', 5000.00),
('demissao', '2025-09-15', 4200.00),
('contratacao', '2025-10-01', 4700.00),
('contratacao', '2025-11-20', 3900.00),
('contratacao', '2025-12-10', 4800.00),
('contratacao', '2026-01-05', 4000.00),
('demissao', '2026-02-15', 4800.00),
('contratacao', '2026-03-20', 4300.00),
('contratacao', '2026-04-10', 4600.00),
('contratacao', '2026-05-15', 4100.00),
('demissao', '2026-06-30', 4600.00),
('contratacao', '2026-07-15', 4400.00),
('contratacao', '2026-08-05', 4000.00),
('contratacao', '2026-09-10', 4700.00),
('demissao', '2026-10-20', 4000.00),
('contratacao', '2026-11-01', 4500.00),
('contratacao', '2026-12-15', 4200.00),
('contratacao', '2027-01-10', 4300.00),
('demissao', '2027-02-25', 4500.00),
('contratacao', '2027-03-15', 4600.00),
('contratacao', '2027-04-10', 4000.00),
('contratacao', '2027-05-05', 4700.00),
('demissao', '2027-06-15', 4300.00),
('contratacao', '2027-07-20', 4800.00),
('contratacao', '2027-08-10', 4200.00),
('contratacao', '2027-09-25', 4000.00),
('demissao', '2027-10-30', 4700.00),
('contratacao', '2027-11-05', 4600.00),
('contratacao', '2027-12-20', 5000.00),
('contratacao', '2028-01-15', 3900.00),
('demissao', '2028-02-28', 3900.00),
('contratacao', '2028-03-10', 4200.00),
('contratacao', '2028-04-05', 4100.00),
('contratacao', '2028-05-15', 4600.00),
('demissao', '2028-06-30', 4100.00),
('contratacao', '2028-07-20', 4500.00),
('contratacao', '2028-08-10', 4800.00),
('contratacao', '2028-09-05', 4700.00),
('demissao', '2028-10-25', 4500.00),
('contratacao', '2028-11-15', 4000.00),
('contratacao', '2028-12-05', 4200.00),
('contratacao', '2029-01-01', 4500.00),
('demissao', '2029-02-14', 4200.00),
('contratacao', '2029-03-15', 4600.00),
('contratacao', '2029-04-10', 5000.00),
('contratacao', '2029-05-05', 4300.00),
('demissao', '2029-06-30', 4300.00),
('contratacao', '2029-07-20', 4600.00),
('contratacao', '2029-08-10', 4800.00),
('contratacao', '2029-09-15', 4400.00),
('demissao', '2029-10-20', 4400.00),
('contratacao', '2029-11-10', 4700.00),
('contratacao', '2029-12-05', 4300.00),
('contratacao', '2030-01-15', 4100.00),
('demissao', '2030-02-20', 4100.00),
('contratacao', '2030-03-05', 4800.00),
('contratacao', '2030-04-10', 4600.00),
('contratacao', '2030-05-20', 4200.00),
('demissao', '2030-06-15', 4800.00),
('contratacao', '2030-07-05', 4300.00),
('contratacao', '2030-08-25', 4500.00),
('contratacao', '2030-09-10', 4000.00),
('demissao', '2030-10-05', 4500.00),
('contratacao', '2030-11-01', 4700.00);



select * from funcionario;

select * from historico_contratacao;

/*Media salarial anual*/
SELECT EXTRACT(YEAR FROM data_contratacao) AS ano, AVG(salario) AS media_salarial
FROM funcionario
GROUP BY EXTRACT(YEAR FROM data_contratacao)
ORDER BY ano;

/*Moda*/
SELECT salario, COUNT(*) AS frequencia
FROM funcionario
GROUP BY salario
ORDER BY frequencia DESC
LIMIT 1; -- para pegar apenas um valor da moda


-- Mediana
SELECT AVG(salario) AS mediana
FROM (
    SELECT salario,
           ROW_NUMBER() OVER (ORDER BY salario) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM funcionario
) AS subquery
WHERE row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));

-- Análise: Maior número de contratações.CREATE DATABASE `estatistica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

SELECT EXTRACT(YEAR FROM data_evento) AS ano, COUNT(*) AS total_contratacoes
FROM historico_contratacao
WHERE evento = 'contratacao'
GROUP BY EXTRACT(YEAR FROM data_evento)
ORDER BY total_contratacoes DESC;

-- Análise: Ano com base salarial mais alta.
SELECT EXTRACT(YEAR FROM data_contratacao) AS ano, AVG(salario) AS media_salarial
FROM funcionario
GROUP BY EXTRACT(YEAR FROM data_contratacao)
ORDER BY media_salarial DESC;

-- Análise: Ano com a maior quantidade de funcionários.
SELECT EXTRACT(YEAR FROM data_contratacao) AS ano, COUNT(*) AS total_funcionarios
FROM funcionario
GROUP BY EXTRACT(YEAR FROM data_contratacao)
ORDER BY total_funcionarios DESC;

-- Análise: Ano com maior número de demissões.
SELECT EXTRACT(YEAR FROM data_evento) AS ano, COUNT(*) AS total_demissoes
FROM historico_contratacao
WHERE evento = 'demissao'
GROUP BY EXTRACT(YEAR FROM data_evento)
ORDER BY total_demissoes DESC;


-- Desvio Padrão
SELECT STDDEV(salario) AS desvio_padrao
FROM funcionario;

-- Ponto Médio
SELECT AVG(salario) AS ponto_medio
FROM funcionario;

-- Coeficiente de Variação
SELECT 
    (STDDEV(salario) / AVG(salario)) * 100 AS coeficiente_variacao
FROM funcionario;








