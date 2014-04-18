drop table videos;

create table videos
(
  id serial4 primary key,
  title varchar(1000),
  url varchar(1000),
  description varchar(1000),
  tag varchar(1000)
);