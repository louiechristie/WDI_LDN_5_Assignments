CREATE TABLE categories(
id serial4 PRIMARY KEY,
name varchar(255) NOT NULL);

CREATE TABLE portfolios(
id serial4 PRIMARY KEY,
name varchar(255) NOT NULL,
description text,
category_id integer);