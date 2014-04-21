drop table todolist;

create table todolist
(
  id serial4 primary key,
  title varchar(100),
  task varchar(1000)
);