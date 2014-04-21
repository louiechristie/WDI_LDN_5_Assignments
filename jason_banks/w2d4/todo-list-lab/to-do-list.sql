drop table todos;

create table todos
  (id serial4 primary key,
  item varchar(255),
  description varchar(1000),
  created_at time default current_timestamp);