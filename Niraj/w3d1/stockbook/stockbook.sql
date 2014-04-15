create table categories (
  id serial4 primary key,
  name varchar(255) not null
);

create table portfolios (
  id serial4 primary key,
  name varchar(255) not null,
  description text,
  category_id integer
);

create table stocks (
  id serial4 primary key,
  symbol varchar(255) not null,
  name varchar(255),
  buying_price decimal,
  holding integer,
  portfolio_id integer
)