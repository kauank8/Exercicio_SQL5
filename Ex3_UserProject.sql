Use EX_USERPROJECT
Go
--Quantidade de projetos sem usuarios
Select COUNT (pj.id_project) as qty_projects_no_users
From Projects pj Left Outer Join users_projects up 
On pj.id_project = up.id_project
Where up.id_user is null

--Quantidade de usuario por projeto
Select pj.id_project, pj.nome, COUNT(us.id_user) as qty_user_projects
From Projects pj, Users us, users_projects up
Where pj.id_project = up.id_project
	  And up.id_user = us.id_user
Group by pj.id_project, pj.nome
Order By pj.nome ASC

	
