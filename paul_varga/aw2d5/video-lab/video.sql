-- drop table videos; --

create table videos
(
  id serial4 primary key,
  title varchar(1000),
  description text,
  video_id text,
  genre text
);