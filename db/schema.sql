DROP TABLE if exists authors CASCADE;
DROP TABLE if exists microposts CASCADE;
DROP TABLE if exists tags CASCADE;
DROP TABLE if exists microposts_tags CASCADE;



CREATE TABLE authors (
	id serial primary key,
	name varchar(255),
	occupation varchar(255),
	age integer,
	image_url varchar(512)
);


CREATE TABLE microposts (
	id serial primary key,
	title varchar(255),
	post text, 
	date_created varchar(255),
	author_id integer references authors
);

CREATE TABLE tags (
	id serial primary key,
	value varchar(255)
);

CREATE TABLE microposts_tags (
	micropost_id integer references microposts,
	tag_id integer references tags
);