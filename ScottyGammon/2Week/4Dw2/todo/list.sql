drop table todos;

create table todos
(
  id serial4 primary key,
  item varchar(1000),
  completeness boolean,
  duedate varchar(6)
            
 );