-- Create database
CREATE DATABASE catalog_of_my_things;

-- Authors table
CREATE TABLE authors(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

-- Genres table
CREATE TABLE genres(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL
);

-- Sources table
CREATE TABLE sources(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL
);

-- Label table
CREATE TABLE labels(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL
);

-- Items table
CREATE TABLE items(
  id            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_id      INT REFERENCES genres(id),
  author_id     INT REFERENCES authors(id),
  source_id     INT REFERENCES sources(id),
  label_id      INT REFERENCES labels(id),
  publish_date  DATE NOT NULL,
  archived      BOOLEAN NOT NULL,
  type          VARCHAR(255) NOT NULL
);

-- Books table
CREATE TABLE books(
  id            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publisher     VARCHAR(255) NOT NULL,
  cover_state   VARCHAR(255) NOT NULL,
  FOREIGN KEY (id) REFERENCES items(id)
);

-- Music albums table
CREATE TABLE music_albums(
  id            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  on_spotify    BOOLEAN NOT NULL,
  FOREIGN KEY (id) REFERENCES items(id)
);

-- Games table
CREATE TABLE games(
  id              INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  multiplayer     VARCHAR(255) NOT NULL,
  last_played_at  DATE NOT NULL,
  FOREIGN KEY (id) REFERENCES items(id)
);
