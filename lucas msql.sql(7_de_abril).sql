
select nome_do_produto, max (preco_de_lista) from tabela_de_produtos group by NOME_DO_PRODUTO, PRECO_DE_LISTA;
/*SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE
WHEN preco_de_lista >= 14 then"PRODUTO CARO"
WHEN preco_de_lista >= 7 AND PRECO_DE_LISTA <12 THEN "PRODUTO POBRE"
ELSE "PRODUTO BARATO"
END AS ESTATUS_PRECO FROM TABELA_DE_PRODUTOS,

/*VEJA O ANO DE NACIMENTO DOS CLIENTES E CLASSIFIQUE-OS COMO:
NACIDOS ANTES DE 1990 SAO VELHOS, NASCIDOS ENTRE
1990 E 1995 SAO JOVENS E NASCIDOS DEPOIS  DE 1995 SAO CRIANÇAS,
LISTEM OS NOMES DOS CLIENTES E A CLASSIFICACAO*/


/*SELECT nome, tabela_de_clientes,
CASE
WHEN DATA_DE_NACIMENTO >= "1995" then"VELHO"
WHEN DATA_DE_NACIMENTO >= 1990 AND PRECO_DE_LISTA <1995 THEN "JOVEM"
ELSE "PRODUTO BARATO"
END AS ESTATUS_IDADE FROM TABELA_DE_crianca/*


select nome*/

select * from tabela_de_vendedores;
select * from  notas_fiscais;



select *  from tabela_de_vendedores as tv
inner join notas_fiscais  as nf
on tv.MATRICULA = nf.MATRICULA;


#quantas notas fiscais cada vendedor imitiu ?
select tv.matricula, tv.NOME,count(*) as total_nf
from tabela_de_vendedores as tv
inner join notas_fiscais as nf
on tv.MATRICULA = nf.MATRICULA
group by tv.MATRICULA,tv.NOME;

/*obtenha o faturamento anual da empresa ,levando em  concideracao que
o  valor financeiro das   vendas e obtido pela multiplicaçao  da quantidade  de  preco*/

 select year(nf.data_venda) as ano,sum(inf.QUANTIDADE* inf.PRECO)  
 from notas_fiscais as  nf
 inner join itens_notas_fiscais as inf
 on nf.NUMERO = inf.NUMERO;
 
 select * from notas_fiscais where matricula = (
 select matricula from tabela_de_vendedores
 where nome = "márcio almeida silva"
 );
 
 select * from notas_fiscais as  nf
 inner join tabela_de_vendedores as tv
 on nf.MATRICULA = tv.MATRICULA;
 

/* O volume_de_compra(tabela_de_clientes) é a quantidade(itens_notas_fiscais) é
o campo que representa a quantidade do produto comprado.
A partir da comparação do volume de compras e da quantidade é possivel 
dizer se as vendas do mes foram validas ou invalidas
*/


select* from tabela_de_clientes;
select* from itens_notas_fiscais;
/*selecao das colunas de interese*/
select nf.cpf, nf.DATA_VENDA , inf.quantidade from notas_fiscais as nf
inner join itens_notas_fiscais as inf
on nf .NUMERO = inf.NUMERO;

#manipula a data (ano e mes)
select nf,CPF, date_format(nf.DATA_VENDA, "%y - %m" ) as DATA_VWENDA, 
sum(inf.QUANTIDADE) as QUANTIDADE
from notas_fiscais as nf
inner join itens_notas_fiscais as inf
on nf.NUMERO = inf.NUMERO
group by nf.CPF,DATA_VENDA;




select tp.sabor, nf.data_venda, inf.quantidade
from tabela_de_produtos as tp
inner join itens_notas_fiscais as inf
on tp.codigo_do_produto 
inner join notas_fiscais as nf
on nf.numero = inf.NUMERO;


#alterar a coluna de data
select tp.sabor, date_format(nf.data_venda, "%y - %m" ) as data_venda, inf.quantidade
from tabela_de_produtos as tp
inner join itens_notas_fiscais as inf
on tp.codigo_do_produto 
inner join notas_fiscais as nf
on nf.numero = inf.NUMERO;