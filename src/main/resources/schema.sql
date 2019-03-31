DROP TABLE IF EXISTS oauth_client_details;
DROP TABLE IF EXISTS oauth_client_token;
DROP TABLE IF EXISTS oauth_access_token;
DROP TABLE IF EXISTS oauth_refresh_token;
DROP TABLE IF EXISTS oauth_code;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurant_menu;
DROP TABLE IF EXISTS item_customization;
DROP TABLE IF EXISTS customizations;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS restaurant_address;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS restaurant_manager;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS user_authorities;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS files;

CREATE TABLE files (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(128) NOT NULL UNIQUE,
    extension VARCHAR(50) NOT NULL,
    data BYTEA NOT NULL
);

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(256) UNIQUE,
    password VARCHAR(256) NOT NULL,
    name VARCHAR(100),
    avatar UUID REFERENCES files(id),
    push_token VARCHAR(100),
    enabled BOOLEAN DEFAULT TRUE,
    credentials_expired BOOLEAN DEFAULT FALSE
);

CREATE TABLE authorities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(256) NOT NULL UNIQUE
);

CREATE TABLE user_authorities (
    user_id UUID NOT NULL,
    authority_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, authority_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (authority_id) REFERENCES authorities(id)
);

CREATE TABLE restaurants (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    logo UUID REFERENCES files(id)
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
    description VARCHAR(100),
    price NUMERIC(10, 4) NOT NULL DEFAULT 0.0
);

CREATE TABLE customizations (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(100),
    price NUMERIC(10, 4) NOT NULL DEFAULT 0.0
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

CREATE TABLE order_items (
    order_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE IF NOT EXISTS oauth_client_details (
    client_id VARCHAR(256) PRIMARY KEY,
    resource_ids VARCHAR(256),
    client_secret VARCHAR(256) NOT NULL,
    scope VARCHAR(256),
    authorized_grant_types VARCHAR(256),
    web_server_redirect_uri VARCHAR(256),
    authorities VARCHAR(256),
    access_token_validity INTEGER,
    refresh_token_validity INTEGER,
    additional_information VARCHAR(4000),
    autoapprove VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_client_token (
    token_id VARCHAR(256),
    token BYTEA,
    authentication_id VARCHAR(256) PRIMARY KEY,
    user_name VARCHAR(256),
    client_id VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_access_token (
    token_id VARCHAR(256),
    token BYTEA,
    authentication_id VARCHAR(256),
    user_name VARCHAR(256),
    client_id VARCHAR(256),
    authentication BYTEA,
    refresh_token VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_refresh_token (
    token_id VARCHAR(256),
    token BYTEA,
    authentication BYTEA
);

CREATE TABLE IF NOT EXISTS oauth_code (
    code VARCHAR(256), authentication BYTEA
);