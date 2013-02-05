create table movie_info
  (
    id serial8 primary key,
    title varchar(100),
    year char(4),
    rated varchar(10),
    released date,
    runtime varchar(10),
    genre varchar(100),
    director varchar(50),
    writer varchar(300),
    actors varchar(500),
    plot varchar(500),
    poster varchar(500),
    imdbrating varchar(5),
    imdbvotes varchar(500),
    imdbid varchar(500),
    response varchar(6)
    );