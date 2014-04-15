DROP TABLE videos;

CREATE TABLE videos
  (id varchar(255) PRIMARY KEY,
  title varchar(255) NOT NULL,
  keyword varchar(40) NOT NULL,
  upload_time timestamp(0) DEFAULT current_timestamp);