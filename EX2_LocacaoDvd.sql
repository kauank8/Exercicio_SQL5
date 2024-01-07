Use LocacaoDVD

--Select filme e dvd da matilde 
Select cl.num_cadastro, cl.nome, Convert (char(10),  lc.data_locacao,103) as dataLocacao,
DATEDIFF(day,lc.data_locacao, lc.data_devolucao) as Qtd_dias_alugado, fm.titulo, fm.ano
From Cliente cl, Locacao lc, Filme fm, Dvd dvd
Where cl.num_cadastro = lc.num_cliente
	  And lc.num_dvd = dvd.num_dvd
	  And dvd.id_filme = fm.id_filme
      And cl.nome LIke 'Matilde%'
	  
-- Filmes e estrela de 2015
Select et.nome, et.nome_real, fm.titulo
From Estrela et, Filme fm, Filme_Estrela fe
Where et.id_estrela = fe.id_estrela
	  And  fm.id_filme = fe.id_filme
	  And  fm.ano = '2015'

-- Titulo do filme e data fabricacao com diferença de ano do filme com hoje
Select fm.titulo, CONVERT(char(10),dvd.dataFabricacao,103) as dtFabricacao,
	Case When (DateDiff(YEAR,Cast(fm.ano as varchar(4)),GETDATE()) > 6) 
	Then 
	Cast(DateDiff(YEAR,Cast(fm.ano as varchar(4)),GETDATE()) as varchar) + ' anos '
	Else
	Cast(DateDiff(YEAR,Cast(fm.ano as varchar(4)),GETDATE()) as varchar)
	End as Diferenca_anos_filme	
From Dvd dvd, Filme fm
Where dvd.id_filme = fm.id_filme

