drop table movie;

create table movie
(
  id serial4 primary key,
  title varchar(30),
  description varchar(2000),
  genre varchar(80),
  youtubeID varchar(200)
);