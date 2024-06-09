Queries that may be helpful: 

--Dame el juego que se llame "KLAUS", que tenga 20.0000 descargas y que sea gratuito
select price, downloads, positive, "name" 
from game g
where price = 0 and downloads = 20000 and positive = 3 and "name" = '-KLAUS-';

--Dame el precio y el número de descargas del videojuego "WARSAW"
select "name", price, downloads  
from game g 
where "name" = 'WARSAW';

--Dame el nombre y el numero de las reseñas positivas y negativas de todos los juegos que valgan menos de 15 dolares
select "name" , positive , negative 
from game g 
where price <15;

--Necesito saber todos los juegos que son gratis y que tienen mas de 30.000 reseñas positivas
select "name", price, positive
from game g 
where price = 0 and positive > 30000;

--Necesito saber cual es el juego más caro de la tienda 
select "name", price
from game
where price = (select max(price) from game);

--Necesito saber cual es el juego de pago más barato
select "name" , price 
from game g 
where price = (select min(price) from game where price>0);

--Dame los 10 mejores juegos que tiene la tienda en calificación (mayores reseñas positivas y menos negativas al mismo tiempo)
select "name" , positive, negative 
from game g 
order by negative asc, positive desc
limit 10;

--Dame los 10 peores juegos que tiene la tienda
select "name" , negative 
from game g 
order by negative desc 
limit 10;

--Quiero saber cuales son los juegos que salieron en 2014 y que precio tienen
select "name", release_date, price 
from game g 
where release_date like '%2014%';

--Quiero saber que usuarios de la aplicación viven en Colombia
select u.*, c.*
from users u
join country c on u.country_fk = c.codeid 
where c.name = 'Colombia';

--Quiero saber si existen usuarios de sudan
select u.*, c.*
from users u
join country c on u.country_fk = c.codeid 
where c.name = 'Sudan';

--Quiero saber cuantos usuarios hay de Alemania
select u.*, c.*
from users u
join country c on u.country_fk = c.codeid 
where c.name = 'Germany';


--Quiero saber cuales son las 30 categoria de juegos con más descargas y cuantas descargas tiene cada uno
select c."name" , g.downloads 
from category c, game g, game_category_rel gcr 
where g.downloads = (select max(downloads) from game where downloads>0)
limit 30;

--Quiero saber cual es la categoria de juegos con menos descargas
select c."name" , g.downloads 
from category c, game g, game_category_rel gcr 
where g.downloads = (select min(downloads) from game)
limit 1;

--Quiero saber cual es la categoria con más juegos
select c."name" count g.game_id 
from category c , game g , game_category_rel gcr 
where 
order by *c."name" ;

--Quiero ver el precio del juego menos descargado de toda la tienda 
select "name" , price, downloads 
from game g
where downloads = (select min(downloads) from game g)
limit 1;

--Quiero ver el precio del juego más descargado de toda la tienda 
select "name" , price, downloads 
from game g
where downloads = (select max(downloads) from game g)
limit 1;

--Quiero saber el email de todos los usuarios actuales de la aplicación
select email 
from users u ;

--Quiero saber cuantas categorias de juegos existen en la aplicación
select count(*) as total_categories
from category;

--Quiero saber si existen juegos del 2023 y 2024, saber que precio tienen, cuantas reseñas positivas presentan y cual fue la fecha de lanzamiento exacta 
select "name" , price , positive , release_date 
from game g 
where release_date like '%2023%' or release_date like '%2024%';

--Quiero saber cuantos juegos son actuales o cuantos salieron en el 2023 
select count(*) as games_of_2023
from game g 
where release_date like '%2023%';

--Quiero saber si existe algun juego que tenga 0 reseñas positivas dentro de toda la tienda 
select  "name" , positive 
from game g 
where positive = 0;

--Quiero saber si existen juegos que tengan menos de 30 reseñas negativas, mas de 500 reseñas positivas y que hayan salido el año 2016
select  "name" , positive , negative , release_date 
from game g 
where positive>500 and negative<30 and release_date like '%2016%';

--Quiero saber cuantos juegos pertenecen a una categoria específica por ejemplo la categoria de "Aliens"
select count(*)
from category c, game g 
where c."name" = 'Aliens';

--Quiero saber la cantidad de juegos que tiene un usuario que tenga las letras am en su username y su id de libreria sea 1
select u.user_name , l.library_id , l.games 
from "library" l , game g , game_library_rel glr , users u 
where u.user_name like '%am%' and l.library_id = 1
limit 1;



