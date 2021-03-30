-- conectando no banco de dados coletaIGTI

use coletaIGTI;

-- contando quantas pessoas existem de cada genero
	SELECT genero, count(genero)
	FROM pessoa
	GROUP BY genero;
-- criando tabela temporia idade e criando com uma coluna idade apartir da tabela pessoa
	create temporary table idade
	SELECT	cod_pessoa,
			nome,
			genero,
			data_nascimento,
			TIMESTAMPDIFF(YEAR, pes.data_nascimento, NOW()) AS idade
	FROM pessoa pes;
    
    -- verificando a integridade da tabela temporária idade
    select * from idade;
    
    -- criando uma média (avg) de idade entre homens e mulheres
    SELECT genero, avg(idade)
	FROM idade
	GROUP BY genero;
    
    -- verificando qual é a maior idade entre as pessoas
    select distinct idade
    from idade
    order by idade desc;
    
    -- quantas pessoas compraram o veiculo Uno Attractive 1.0 apartir da data 12/10/2020 ?
    
    select pes.genero, count(vve.cod_modelo) as numero_veiculos
		from venda_veiculo vve
        join modelo_veiculo mve
        on vve.cod_modelo = mve.cod_modelo
        join pessoa pes
        on pes.cod_pessoa = vve.cod_pessoa
        where mve.descricao_modelo = ' Uno Attractive 1.0'
        and vve.data_venda >= '2020-10-12'
        group by pes.genero;
        



-- Contar o número de carros vendidos por modelo

select pes.genero, mve.descricao_modelo, count(vve.cod_modelo) as numero_veiculos
		from venda_veiculo vve
        join modelo_veiculo mve
        on vve.cod_modelo = mve.cod_modelo
        join pessoa pes
        on pes.cod_pessoa = vve.cod_pessoa
        and vve.data_venda >= '2020-10-12'
        group by pes.genero, mve.descricao_modelo;
        
-- Qual fabricante vendeu o maior número de veiculos?

select fab.nome_fabricante, count(cod_venda) as venda_de_veiculos
	from venda_veiculo vve
    join modelo_veiculo mve
    on vve.cod_modelo = mve.cod_modelo
    join fabricante fab
    on fab.cod_fabricante = mve.cod_fabricante
    group by fab.nome_fabricante;
    
-- Qual fabricante vendeu o maior número de veiculos por genero?

select genero, fab.nome_fabricante, count(cod_venda) as venda_de_veiculos
	from venda_veiculo vve
    join pessoa pes
    on pes.cod_pessoa = vve.cod_pessoa
    join modelo_veiculo mve
    on vve.cod_modelo = mve.cod_modelo
    join fabricante fab
    on fab.cod_fabricante = mve.cod_fabricante
    group by pes.genero, fab.nome_fabricante
    order by fab.nome_fabricante, count(cod_venda);