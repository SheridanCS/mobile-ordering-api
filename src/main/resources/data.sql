INSERT INTO users (username, password, name, enabled) VALUES ('catibogt', '', 'Timothy Catibog', TRUE);
INSERT INTO users (username, password, name, enabled) VALUES ('merinchukj', '', 'Jayce Merinchuk', TRUE);

INSERT INTO restaurants (name) VALUES ('Burger King');

/* 1289-1297 Marlborough Ct, Oakville, ON L6H 2R9 */
INSERT INTO addresses (street, city, province, postal_code, country, latitude, longitude) VALUES ('1297 Marlborough Ct', 'Oakville', 'ON', 'L6H2R9', 'CA', 43.4694605, -79.6935888);

INSERT INTO restaurant_address VALUES (1, 1);

INSERT INTO items (name, description) VALUES ('Whopper', '');

INSERT INTO customizations (name, description) VALUES ('Lettuce', '');
INSERT INTO customizations (name, description) VALUES ('Tomato', '');
INSERT INTO customizations (name, description) VALUES ('Onion', '');
INSERT INTO customizations (name, description) VALUES ('Ketchup', '');
INSERT INTO customizations (name, description) VALUES ('Mayo', '');

INSERT INTO item_customization VALUES (1, 1);
INSERT INTO item_customization VALUES (1, 2);
INSERT INTO item_customization VALUES (1, 3);
INSERT INTO item_customization VALUES (1, 4);
INSERT INTO item_customization VALUES (1, 5);

INSERT INTO restaurant_menu VALUES (1, 1);