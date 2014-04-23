CREATE TABLE categories(
id serial4 PRIMARY KEY,
name varchar(255) NOT NULL);

CREATE TABLE portfolios(
id serial4 PRIMARY KEY,
name varchar(255) NOT NULL,
description text,
category_id integer);

CREATE TABLE stocks(
id serial4 PRIMARY KEY,
symbol varchar(255) NOT NULL,
name varchar(255),
buying_price decimal,
holding integer,
portfolio_id integer);