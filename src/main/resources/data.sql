-- INSERT INTO users (email, username, password, name) VALUES ('catibogt@sheridancollege.ca', 'catibogt', '$2y$10$iJizhp.LHs5khCmQSR/O/eQMH5e9IHFUdrsKwRMrmRGUbeG2U24Cm', 'Timothy Catibog');
INSERT INTO users (email, username, password, name) VALUES ('catibogt@sheridancollege.ca', 'catibogt', '$2a$10$jxMUQD.jIEqN.S2jvZWolevShoOfpJ5rJO5rfHGZWVLG/MnZVgzqi', 'Timothy Catibog');
INSERT INTO users (email, username, password, name) VALUES ('merinchukj@gmail.com', 'merinchukj', '$2y$08$y5DVhHGLHExy8ECBMWoYYeyyda6IQi7WxEykSIMxQtZ.nd4lJGeSC', 'Jayce Merinchuk');

INSERT INTO authorities (name) VALUES ('ROLE_SUPERUSER');
INSERT INTO authorities (name) VALUES ('ROLE_MANAGER');
INSERT INTO authorities (name) VALUES ('ROLE_USER');
-- INSERT INTO authorities (name) VALUES ('RESTAURANTS_CREATE');
-- INSERT INTO authorities (name) VALUES ('RESTAURANTS_READ');
-- INSERT INTO authorities (name) VALUES ('RESTAURANTS_UPDATE');
-- INSERT INTO authorities (name) VALUES ('RESTAURANTS_DELETE');
-- INSERT INTO authorities (name) VALUES ('ORDERS_CREATE');
-- INSERT INTO authorities (name) VALUES ('ORDERS_READ');
-- INSERT INTO authorities (name) VALUES ('ORDERS_UPDATE');
-- INSERT INTO authorities (name) VALUES ('ORDERS_DELETE');
-- INSERT INTO authorities (name) VALUES ('ITEMS_CREATE');
-- INSERT INTO authorities (name) VALUES ('ITEMS_READ');
-- INSERT INTO authorities (name) VALUES ('ITEMS_UPDATE');
-- INSERT INTO authorities (name) VALUES ('ITEMS_DELETE');
-- INSERT INTO authorities (name) VALUES ('MENU_CREATE');
-- INSERT INTO authorities (name) VALUES ('MENU_READ');
-- INSERT INTO authorities (name) VALUES ('MENU_UPDATE');
-- INSERT INTO authorities (name) VALUES ('MENU_DELETE');

INSERT INTO user_authorities (user_id, authority_id) SELECT id, 1 FROM users WHERE username = 'catibogt';
INSERT INTO user_authorities (user_id, authority_id) SELECT id, 3 FROM users WHERE username = 'merinchukj';

INSERT INTO restaurants (name) VALUES ('Burger King');
INSERT INTO restaurants (name) VALUES ('Subway');
INSERT INTO restaurants (name) VALUES ('Harvey''s');
INSERT INTO restaurants (name) VALUES ('McDonald''s');
INSERT INTO restaurants (name) VALUES ('Taza Xpress');

/* 1289-1297 Marlborough Ct, Oakville, ON L6H 2R9 */
INSERT INTO addresses (street, city, province, postal_code, country, latitude, longitude) VALUES ('1297 Marlborough Ct', 'Oakville', 'ON', 'L6H2R9', 'CA', 43.4694605, -79.6935888);

INSERT INTO restaurant_address VALUES (1, 1);

INSERT INTO items (name, description, price) VALUES ('Whopper', '', 3.50);

INSERT INTO customizations (name, description) VALUES ('Lettuce', '');
INSERT INTO customizations (name, description) VALUES ('Tomato', '');
INSERT INTO customizations (name, description) VALUES ('Onion', '');
INSERT INTO customizations (name, description) VALUES ('Pickles', '');
INSERT INTO customizations (name, description) VALUES ('Ketchup', '');
INSERT INTO customizations (name, description) VALUES ('Mayo', '');

INSERT INTO item_customization VALUES (1, 1);
INSERT INTO item_customization VALUES (1, 2);
INSERT INTO item_customization VALUES (1, 3);
INSERT INTO item_customization VALUES (1, 4);
INSERT INTO item_customization VALUES (1, 5);

INSERT INTO restaurant_menu VALUES (1, 1);

INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, authorities, access_token_validity)
VALUES ('clientId', '$2a$10$vCXMWCn7fDZWOcLnIEhmK.74dvK1Eh8ae2WrWlhr2ETPLoxQctN4.', 'read,write', 'password,refresh_token,client_credentials', 'ROLE_USER', 300);

-- INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, authorities, access_token_validity, refresh_token_validity)
-- VALUES ('testjwtclientid', 'XY7kmzoNzl100', 'read,write', 'password,refresh_token,client_credentials,authorization_code', 'ROLE_USER', 900, 2592000);
INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, authorities, access_token_validity, refresh_token_validity)
VALUES ('jwtclientid', '$2a$10$966iITtwhskVodTYyZVrXuZME74qodZfj5jpYC0F3fbqYognLNI2y', 'read,write', 'password,refresh_token,client_credentials,authorization_code', 'ROLE_USER', 900, 2592000);