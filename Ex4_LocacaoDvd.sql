Use LocacaoDVD
go
-- Os cliente que alugaram o dvd com maior data de fabricacao
Select cl.num_cadastro, cl.nome, fm.titulo, dvd.dataFabricacao, lc.valor
From Cliente cl, Locacao lc, Dvd dvd, Filme fm
Where cl.num_cadastro = lc.num_cliente
	  And dvd.num_dvd = lc.num_dvd
	  And dvd.id_filme = fm.id_filme
	  And dvd.dataFabricacao in(
	  Select Max(dataFabricacao)
	  from dvd
	  )

-- quantidades de dvd alugado por cliente
Select cl.num_cadastro, cl.nome, Convert(char(10), lc.data_locacao, 103) as dataLocacao, COUNT(cl.num_cadastro) as qtd
From Cliente cl, Locacao lc, Dvd dvd
Where cl.num_cadastro = lc.num_cliente
	  And dvd.num_dvd = lc.num_dvd
Group by cl.num_cadastro, cl.nome, lc.data_locacao
Order by lc.data_locacao

-- valor total de locacao de todos os dvd alugados
Select cl.num_cadastro, cl.nome, Convert(char(10), lc.data_locacao, 103) as dataLocacao, (lc.valor*COUNT(cl.num_cadastro)) as valor_total
From Cliente cl, Locacao lc, Dvd dvd
Where cl.num_cadastro = lc.num_cliente
	  And dvd.num_dvd = lc.num_dvd
Group by cl.num_cadastro, cl.nome, lc.data_locacao,lc.valor
Order by lc.data_locacao

Select * from Locacao
Order by num_cliente

-- Consultar cliente que alugaram dois filme simultaneamente
Select cl.num_cadastro, cl.nome,cl.logradouro + ' ' +CAST(cl.num as varchar(5)) as endereco, Convert(char(10), lc.data_locacao, 103) as dataLocacao
From Cliente cl, Locacao lc, Dvd dvd
Where cl.num_cadastro = lc.num_cliente
	  And dvd.num_dvd = lc.num_dvd
Group by cl.num_cadastro, cl.nome, lc.data_locacao, cl.logradouro, cl.num
Having COUNT(cl.num_cadastro)>1
Order by lc.data_locacao