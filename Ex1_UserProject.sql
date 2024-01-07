Use EX_USERPROJECT

Insert into Users Values
('Joao', 'Ti_joao', '123mudar', 'joao@empresa.com')

Insert into Projects Values
('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PCs', '12/09/2014')

Select * from Projects
Select * from Users
Select * from users_projects

--Selects
--Usuario do re-folha
Select us.id_user, us.nome, us.email, pj.descricao, pj.descricao 
From Users us, Projects pj, users_projects up
Where us.id_user = up.id_user
      And pj.id_project = up.id_project
	  and pj.nome = 'Re-folha'

--Projetos sem usuario
Select pj.nome
From Projects pj Left Outer Join users_projects up
On pj.id_project = up.id_project
Where up.id_user is null

--Usuarios Sem projeto
Select us.nome
From Users us Left Outer Join users_projects up
On us.id_user = up.id_user
Where up.id_project is null

