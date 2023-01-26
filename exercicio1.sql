/*Crie um banco de dados para um serviço de um Games Online. O nome do Banco de dados deverá ter o seguinte nome 
db_generation_game_online. O sistema trabalhará com as informações dos personagens do jogo. 
O sistema trabalhará com 2 tabelas tb_personagens e tb_classes, que deverão estar relacionadas.

CLASSE (1) --- CLASSIFICA --- (N) PERSONAGENS

Boas Práticas:

Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, 
relevantes para classificar os personagens do Game Online.

Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.

Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.

Insira 5 registros na tabela tb_classes.

Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.

Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.

Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.

Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.

Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, 
onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) 
e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.*/

create database db_generation_game_online;

use db_generation_game_online;

create table tb_classes(
id_classes bigint auto_increment,
nome_classes varchar (80),
poder_classes double,
primary key(id_classes)
);

insert into tb_classes(nome_classes, poder_classes) 
values("Heróis", 8330);
insert into tb_classes(nome_classes, poder_classes) 
values("Deuses", 9989);
insert into tb_classes(nome_classes, poder_classes) 
values("Feiticeiros", 7452);
insert into tb_classes(nome_classes, poder_classes) 
values("Orcs", 6587);
insert into tb_classes(nome_classes, poder_classes) 
values("Zumbis", 5273);

create table tb_personagens(
id_personagens bigint auto_increment,
nome_personagens varchar(80),
ataque_personagens decimal,
defesa_personagens decimal,
nivel_personagens bigint,
classe_id bigint,
primary key(id_personagens),
foreign key(classe_id) references tb_classes(id_classes)
);

insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('bruno876', 6700, 5700, 70, 1);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('carlu987', 400, 3568, 89, 5);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('pedro34', 234, 545, 54, 3);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('carlos345', 2343, 34, 5, 4);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('bruna567', 65677, 56, 5, 5);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('loko675', 4555, 456, 9, 4);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('peroba4', 343, 600, 4, 3);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('ruiz66', 2334, 5466, 3, 5);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('rute7', 4334, 57788, 50, 1);
insert into tb_personagens(nome_personagens, ataque_personagens, defesa_personagens, nivel_personagens, classe_id) 
values('biro44', 544455, 25544500, 100, 2);

select * from tb_classes where ataque_personagens > 1000;
select * from tb_personagens where ataque_personagens > 1000;
select * from tb_personagens where defesa_personagens = 1000 or 2000;

select * from tb_personagens where nome_personagens like "%c%";

select nome_personagens, nivel_personagens  
from tb_personagens 
inner join tb_classes 
on 
tb_personagens.classe_id = tb_classes .id_classes 
where tb_classes.nome_classes = 'Deuses';

select *  
from tb_personagens 
left join tb_classes 
on 
tb_personagens.classe_id = tb_classes .id_classes;

select *  
from tb_personagens 
right join tb_classes 
on 
tb_personagens.classe_id = tb_classes .id_classes where
nivel_personagens = 2;