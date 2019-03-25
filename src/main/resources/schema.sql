DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurant_menu;
DROP TABLE IF EXISTS item_customization;
DROP TABLE IF EXISTS customizations;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS restaurant_address;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS restaurant_manager;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    push_token VARCHAR(100),
    enabled BOOLEAN
);

CREATE TABLE restaurants (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE restaurant_manager (
    restaurant_id BIGINT NOT NULL,
    manager_id UUID NOT NULL,
    PRIMARY KEY (restaurant_id, manager_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (manager_id) REFERENCES users(id)
);

CREATE TABLE addresses (
    id BIGSERIAL PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    postal_code VARCHAR(6) NOT NULL,
    country VARCHAR(2) NOT NULL,
    latitude NUMERIC NOT NULL,
    longitude NUMERIC NOT NULL
);

CREATE TABLE restaurant_address (
    restaurant_id BIGINT NOT NULL,
    address_id BIGINT NOT NULL,
    PRIMARY KEY (restaurant_id, address_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (id),
    FOREIGN KEY (address_id) REFERENCES addresses (id)
);

CREATE TABLE items (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(100)
);

CREATE TABLE customizations (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(100)
);

CREATE TABLE item_customization (
    item_id BIGINT NOT NULL,
    customization_id BIGINT NOT NULL,
    PRIMARY KEY (item_id, customization_id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (customization_id) REFERENCES customizations(id)
);

CREATE TABLE restaurant_menu (
    restaurant_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    PRIMARY KEY (restaurant_id, item_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    user_id UUID NOT NULL,
    restaurant_id BIGINT NOT NULL,
    date_placed TIMESTAMP NOT NULL,
    status SMALLINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

