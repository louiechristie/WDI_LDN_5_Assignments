create table videos
(
  id serial4 primary key,
  video_name varchar(255),
  video_description varchar(255),
  video_id varchar(255), 
  tags varchar(255)[ ],
  created_at date,
  updated_at date,
  posted_by text
);