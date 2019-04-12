INSERT INTO users (email, username, password, name) VALUES ('catibogt@sheridancollege.ca', 'catibogt', '$2a$10$jxMUQD.jIEqN.S2jvZWolevShoOfpJ5rJO5rfHGZWVLG/MnZVgzqi', 'Timothy Catibog');
INSERT INTO users (email, username, password, name) VALUES ('merinchukj@gmail.com', 'merinchukj', '$2a$10$WuKggmuSQNhnr78UYjL.GeXAtGH8rJjEwrXNWYMjhVJyKxZ.8o/ZO', 'Jayce Merinchuk');

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

INSERT INTO addresses (street, city, province, postal_code, country, latitude, longitude) VALUES ('1297 Marlborough Ct', 'Oakville', 'ON', 'L6H2R9', 'CA', 43.4694605, -79.6935888);
INSERT INTO addresses (street, city, province, postal_code, country, latitude, longitude) VALUES ('1430 Trafalgar Rd', 'Oakville', 'ON', 'L6H2L1', 'CA', 43.469171, -79.694144);
INSERT INTO addresses (street, city, province, postal_code, country, latitude, longitude) VALUES ('1430 Trafalgar Rd', 'Oakville', 'ON', 'L6H2L1', 'CA', 43.469171, -79.694144);
INSERT INTO addresses (street, city, province, postal_code, country, latitude, longitude) VALUES ('375 Iroquois Shore Rd', 'Oakville', 'ON', 'L6H1M3', 'CA', 43.465499, -79.685029);
INSERT INTO addresses (street, city, province, postal_code, country, latitude, longitude) VALUES ('1289 Marlborough Ct', 'Oakville', 'ON', 'L6H1M3', 'CA', 43.469461, -79.693589);

/* ----- Restaurant Addresses (Restaurant, Address) */
INSERT INTO restaurant_address VALUES (1, 1);
INSERT INTO restaurant_address VALUES (2, 2);
INSERT INTO restaurant_address VALUES (3, 3);
INSERT INTO restaurant_address VALUES (4, 4);
INSERT INTO restaurant_address VALUES (5, 5);


/* -----  All Restaurant Items  ----- */
-- Burger King --
INSERT INTO items (name, description, price) VALUES ('Whopper', '', 5.50); -- 1
INSERT INTO items (name, description, price) VALUES ('Crispy Chicken Sandwich', '', 5.50); -- 2
INSERT INTO items (name, description, price) VALUES ('Original Chicken Sandwich', '', 5.50); -- 3
-- Subway --
INSERT INTO items (name, description, price) VALUES ('Turkey Sub', '', 5.50); -- 4
INSERT INTO items (name, description, price) VALUES ('Pizza Sub', '', 5.50); -- 5
INSERT INTO items (name, description, price) VALUES ('Subway Club', '', 5.50); -- 6
INSERT INTO items (name, description, price) VALUES ('Tuna Sub', '', 5.50); -- 7
-- Harvey's --
INSERT INTO items (name, description, price) VALUES ('Original Burger', '', 5.50); -- 8
INSERT INTO items (name, description, price) VALUES ('Angus Burger', '', 5.50); -- 9
-- McDonald's --
INSERT INTO items (name, description, price) VALUES ('Big Mac', '', 5.50); -- 10
INSERT INTO items (name, description, price) VALUES ('McChicken Sandwich', '', 5.50); -- 11
-- Taza Express --
INSERT INTO items (name, description, price) VALUES ('Chicken Shawarma', '', 8.50); -- 12
INSERT INTO items (name, description, price) VALUES ('Beef Shawarma', '', 7.50); -- 13
/* ----- Restaurant Sides ----- */
INSERT INTO items (name, description, price) VALUES ('Fries', '', 2.00); -- 14
INSERT INTO items (name, description, price) VALUES ('Poutine', '', 3.50); -- 15
INSERT INTO items (name, description, price) VALUES ('Chips', '', 2.25); -- 16
INSERT INTO items (name, description, price) VALUES ('Caesar Salad', '', 3.00); -- 17
/* ----- Restaurant Drinks ----- */
INSERT INTO items (name, description, price) VALUES ('Soft Drink', '', 1.00); -- 18
INSERT INTO items (name, description, price) VALUES ('Coffee', '', 1.00); -- 19


/* ----- All Restaurant Toppings ----- */
INSERT INTO customizations (name, description) VALUES ('Lettuce', ''); -- 1
INSERT INTO customizations (name, description) VALUES ('Tomato', ''); -- 2
INSERT INTO customizations (name, description) VALUES ('Onion', ''); -- 3
INSERT INTO customizations (name, description) VALUES ('Pickles', ''); -- 4
INSERT INTO customizations (name, description) VALUES ('Hot Peppers', ''); -- 5
INSERT INTO customizations (name, description) VALUES ('Black Olives', ''); -- 6
INSERT INTO customizations (name, description) VALUES ('Cucumbers', ''); -- 7
INSERT INTO customizations (name, description) VALUES ('Ketchup', ''); -- 8
INSERT INTO customizations (name, description) VALUES ('Mayo', ''); -- 9
INSERT INTO customizations (name, description) VALUES ('Mustard', ''); -- 10
INSERT INTO customizations (name, description) VALUES ('Sub Sauce', ''); -- 11
INSERT INTO customizations (name, description) VALUES ('Gravy', ''); -- 12
INSERT INTO customizations (name, description) VALUES ('Tzatziki', ''); -- 13
INSERT INTO customizations (name, description) VALUES ('BBQ Sauce', ''); -- 14
INSERT INTO customizations (name, description) VALUES ('Chipotle', ''); -- 15
INSERT INTO customizations (name, description) VALUES ('Hot Sauce', ''); -- 16
INSERT INTO customizations (name, description) VALUES ('Garlic Mayo', ''); -- 17
INSERT INTO customizations (name, description) VALUES ('Sriracha Sauce', ''); -- 18
INSERT INTO customizations (name, description) VALUES ('Ranch', ''); -- 19
INSERT INTO customizations (name, description) VALUES ('Relish', ''); -- 20
INSERT INTO customizations (name, description) VALUES ('Cheese', ''); -- 21
INSERT INTO customizations (name, description) VALUES ('Bacon', ''); -- 22
INSERT INTO customizations (name, description) VALUES ('Ham', ''); -- 23
INSERT INTO customizations (name, description) VALUES ('Turkey', ''); -- 24
INSERT INTO customizations (name, description) VALUES ('Chicken', ''); -- 25
INSERT INTO customizations (name, description) VALUES ('Pepperoni', ''); -- 26
INSERT INTO customizations (name, description) VALUES ('Tuna', ''); -- 27
INSERT INTO customizations (name, description) VALUES ('Coke', ''); -- 28
INSERT INTO customizations (name, description) VALUES ('Pepsi', ''); -- 29
INSERT INTO customizations (name, description) VALUES ('Sprite', ''); -- 30
INSERT INTO customizations (name, description) VALUES ('7up', ''); -- 31
INSERT INTO customizations (name, description) VALUES ('Orange Fanta', ''); -- 32
INSERT INTO customizations (name, description) VALUES ('Iced Tea', ''); -- 33
INSERT INTO customizations (name, description) VALUES ('Milk', ''); -- 34
INSERT INTO customizations (name, description) VALUES ('Cream', ''); -- 35
INSERT INTO customizations (name, description) VALUES ('Sugar', ''); -- 36
INSERT INTO customizations (name, description) VALUES ('Sweetener', ''); -- 37

/* ----- All Items and Their Toppings (Item, Topping) ----- */
-- Whopper Toppings --
INSERT INTO item_customization VALUES (1, 1);
INSERT INTO item_customization VALUES (1, 2);
INSERT INTO item_customization VALUES (1, 3);
INSERT INTO item_customization VALUES (1, 4);
INSERT INTO item_customization VALUES (1, 8);
INSERT INTO item_customization VALUES (1, 9);
INSERT INTO item_customization VALUES (1, 18);
INSERT INTO item_customization VALUES (1, 19);
-- Crispy Chicken Sandwich Toppings --
INSERT INTO item_customization VALUES (2, 2);
INSERT INTO item_customization VALUES (2, 3);
INSERT INTO item_customization VALUES (2, 4);
INSERT INTO item_customization VALUES (2, 8);
INSERT INTO item_customization VALUES (2, 10);
INSERT INTO item_customization VALUES (2, 19);
INSERT INTO item_customization VALUES (2, 20);
INSERT INTO item_customization VALUES (2, 21);
INSERT INTO item_customization VALUES (2, 22);
-- Original Chicken Sandwich Toppings --
INSERT INTO item_customization VALUES (3, 2);
INSERT INTO item_customization VALUES (3, 3);
INSERT INTO item_customization VALUES (3, 4);
INSERT INTO item_customization VALUES (3, 8);
INSERT INTO item_customization VALUES (3, 10);
INSERT INTO item_customization VALUES (3, 19);
INSERT INTO item_customization VALUES (3, 20);
INSERT INTO item_customization VALUES (3, 21);
INSERT INTO item_customization VALUES (3, 22);
-- Turkey Sub Toppings --
INSERT INTO item_customization VALUES (4, 1);
INSERT INTO item_customization VALUES (4, 2);
INSERT INTO item_customization VALUES (4, 3);
INSERT INTO item_customization VALUES (4, 4);
INSERT INTO item_customization VALUES (4, 5);
INSERT INTO item_customization VALUES (4, 6);
INSERT INTO item_customization VALUES (4, 7);
INSERT INTO item_customization VALUES (4, 9);
INSERT INTO item_customization VALUES (4, 10);
INSERT INTO item_customization VALUES (4, 11);
INSERT INTO item_customization VALUES (4, 14);
INSERT INTO item_customization VALUES (4, 15);
INSERT INTO item_customization VALUES (4, 16);
INSERT INTO item_customization VALUES (4, 19);
INSERT INTO item_customization VALUES (4, 20);
INSERT INTO item_customization VALUES (4, 21);
INSERT INTO item_customization VALUES (4, 22);
INSERT INTO item_customization VALUES (4, 23);
INSERT INTO item_customization VALUES (4, 24);
INSERT INTO item_customization VALUES (4, 25);
INSERT INTO item_customization VALUES (4, 26);
INSERT INTO item_customization VALUES (4, 27);
-- Pizza Sub Toppings --
INSERT INTO item_customization VALUES (5, 1);
INSERT INTO item_customization VALUES (5, 2);
INSERT INTO item_customization VALUES (5, 3);
INSERT INTO item_customization VALUES (5, 4);
INSERT INTO item_customization VALUES (5, 5);
INSERT INTO item_customization VALUES (5, 6);
INSERT INTO item_customization VALUES (5, 7);
INSERT INTO item_customization VALUES (5, 9);
INSERT INTO item_customization VALUES (5, 10);
INSERT INTO item_customization VALUES (5, 11);
INSERT INTO item_customization VALUES (5, 14);
INSERT INTO item_customization VALUES (5, 15);
INSERT INTO item_customization VALUES (5, 16);
INSERT INTO item_customization VALUES (5, 19);
INSERT INTO item_customization VALUES (5, 20);
INSERT INTO item_customization VALUES (5, 21);
INSERT INTO item_customization VALUES (5, 22);
INSERT INTO item_customization VALUES (5, 23);
INSERT INTO item_customization VALUES (5, 24);
INSERT INTO item_customization VALUES (5, 25);
INSERT INTO item_customization VALUES (5, 26);
INSERT INTO item_customization VALUES (5, 27);
-- Subway Club Toppings --
INSERT INTO item_customization VALUES (6, 1);
INSERT INTO item_customization VALUES (6, 2);
INSERT INTO item_customization VALUES (6, 3);
INSERT INTO item_customization VALUES (6, 4);
INSERT INTO item_customization VALUES (6, 5);
INSERT INTO item_customization VALUES (6, 6);
INSERT INTO item_customization VALUES (6, 7);
INSERT INTO item_customization VALUES (6, 9);
INSERT INTO item_customization VALUES (6, 10);
INSERT INTO item_customization VALUES (6, 11);
INSERT INTO item_customization VALUES (6, 14);
INSERT INTO item_customization VALUES (6, 15);
INSERT INTO item_customization VALUES (6, 16);
INSERT INTO item_customization VALUES (6, 19);
INSERT INTO item_customization VALUES (6, 20);
INSERT INTO item_customization VALUES (6, 21);
INSERT INTO item_customization VALUES (6, 22);
INSERT INTO item_customization VALUES (6, 23);
INSERT INTO item_customization VALUES (6, 24);
INSERT INTO item_customization VALUES (6, 25);
INSERT INTO item_customization VALUES (6, 26);
INSERT INTO item_customization VALUES (6, 27);
-- Tuna Sub Toppings --
INSERT INTO item_customization VALUES (7, 1);
INSERT INTO item_customization VALUES (7, 2);
INSERT INTO item_customization VALUES (7, 3);
INSERT INTO item_customization VALUES (7, 4);
INSERT INTO item_customization VALUES (7, 5);
INSERT INTO item_customization VALUES (7, 6);
INSERT INTO item_customization VALUES (7, 7);
INSERT INTO item_customization VALUES (7, 9);
INSERT INTO item_customization VALUES (7, 10);
INSERT INTO item_customization VALUES (7, 11);
INSERT INTO item_customization VALUES (7, 14);
INSERT INTO item_customization VALUES (7, 15);
INSERT INTO item_customization VALUES (7, 16);
INSERT INTO item_customization VALUES (7, 19);
INSERT INTO item_customization VALUES (7, 20);
INSERT INTO item_customization VALUES (7, 21);
INSERT INTO item_customization VALUES (7, 22);
INSERT INTO item_customization VALUES (7, 23);
INSERT INTO item_customization VALUES (7, 24);
INSERT INTO item_customization VALUES (7, 25);
INSERT INTO item_customization VALUES (7, 26);
INSERT INTO item_customization VALUES (7, 27);
-- Original Burger Toppings --
INSERT INTO item_customization VALUES (8, 1);
INSERT INTO item_customization VALUES (8, 2);
INSERT INTO item_customization VALUES (8, 3);
INSERT INTO item_customization VALUES (8, 4);
INSERT INTO item_customization VALUES (8, 5);
INSERT INTO item_customization VALUES (8, 8);
INSERT INTO item_customization VALUES (8, 9);
INSERT INTO item_customization VALUES (8, 10);
INSERT INTO item_customization VALUES (8, 19);
INSERT INTO item_customization VALUES (8, 20);
INSERT INTO item_customization VALUES (8, 21);
INSERT INTO item_customization VALUES (8, 22);
-- Angus Burger Toppings --
INSERT INTO item_customization VALUES (9, 1);
INSERT INTO item_customization VALUES (9, 2);
INSERT INTO item_customization VALUES (9, 3);
INSERT INTO item_customization VALUES (9, 4);
INSERT INTO item_customization VALUES (9, 5);
INSERT INTO item_customization VALUES (9, 8);
INSERT INTO item_customization VALUES (9, 9);
INSERT INTO item_customization VALUES (9, 10);
INSERT INTO item_customization VALUES (9, 19);
INSERT INTO item_customization VALUES (9, 20);
INSERT INTO item_customization VALUES (9, 21);
INSERT INTO item_customization VALUES (9, 22);
-- BigMac Toppings --
INSERT INTO item_customization VALUES (10, 1);
INSERT INTO item_customization VALUES (10, 2);
INSERT INTO item_customization VALUES (10, 3);
INSERT INTO item_customization VALUES (10, 4);
INSERT INTO item_customization VALUES (10, 8);
INSERT INTO item_customization VALUES (10, 9);
INSERT INTO item_customization VALUES (10, 10);
INSERT INTO item_customization VALUES (10, 14);
INSERT INTO item_customization VALUES (10, 19);
INSERT INTO item_customization VALUES (10, 21);
INSERT INTO item_customization VALUES (10, 22);
-- McChicken Sandwich Toppings --
INSERT INTO item_customization VALUES (11, 1);
INSERT INTO item_customization VALUES (11, 2);
INSERT INTO item_customization VALUES (11, 3);
INSERT INTO item_customization VALUES (11, 4);
INSERT INTO item_customization VALUES (11, 8);
INSERT INTO item_customization VALUES (11, 9);
INSERT INTO item_customization VALUES (11, 10);
INSERT INTO item_customization VALUES (11, 14);
INSERT INTO item_customization VALUES (11, 19);
INSERT INTO item_customization VALUES (11, 21);
INSERT INTO item_customization VALUES (11, 22);
-- Chicken Shawarma Toppings --
INSERT INTO item_customization VALUES (12, 1);
INSERT INTO item_customization VALUES (12, 2);
INSERT INTO item_customization VALUES (12, 16);
-- Beef Shawarma Toppings --
INSERT INTO item_customization VALUES (13, 1);
INSERT INTO item_customization VALUES (13, 2);
INSERT INTO item_customization VALUES (13, 16);
-- Fries Toppings --
INSERT INTO item_customization VALUES (14, 12);
-- Soft Drink Options --
INSERT INTO item_customization VALUES (18, 28);
INSERT INTO item_customization VALUES (18, 29);
INSERT INTO item_customization VALUES (18, 30);
INSERT INTO item_customization VALUES (18, 31);
INSERT INTO item_customization VALUES (18, 32);
INSERT INTO item_customization VALUES (18, 33);
-- Coffee Options --
INSERT INTO item_customization VALUES (18, 34);
INSERT INTO item_customization VALUES (18, 35);
INSERT INTO item_customization VALUES (18, 36);
INSERT INTO item_customization VALUES (18, 37);

/* ----- Insert Restaurant Items into Menus (Restaurant, Item) ----- */
-- Burger King Items --
INSERT INTO restaurant_menu VALUES (1, 1);
INSERT INTO restaurant_menu VALUES (1, 2);
INSERT INTO restaurant_menu VALUES (1, 3);
INSERT INTO restaurant_menu VALUES (1, 14);
INSERT INTO restaurant_menu VALUES (1, 15);
INSERT INTO restaurant_menu VALUES (1, 17);
INSERT INTO restaurant_menu VALUES (1, 18);
INSERT INTO restaurant_menu VALUES (1, 19);
-- Subway Items --
INSERT INTO restaurant_menu VALUES (2, 4);
INSERT INTO restaurant_menu VALUES (2, 5);
INSERT INTO restaurant_menu VALUES (2, 6);
INSERT INTO restaurant_menu VALUES (2, 7);
INSERT INTO restaurant_menu VALUES (2, 14);
INSERT INTO restaurant_menu VALUES (2, 16);
INSERT INTO restaurant_menu VALUES (2, 17);
INSERT INTO restaurant_menu VALUES (2, 18);
INSERT INTO restaurant_menu VALUES (2, 19);
-- Harvey's Items --
INSERT INTO restaurant_menu VALUES (3, 8);
INSERT INTO restaurant_menu VALUES (3, 9);
INSERT INTO restaurant_menu VALUES (3, 14);
INSERT INTO restaurant_menu VALUES (3, 15);
INSERT INTO restaurant_menu VALUES (3, 17);
INSERT INTO restaurant_menu VALUES (3, 18);
INSERT INTO restaurant_menu VALUES (3, 19);
-- McDonald's Items --
INSERT INTO restaurant_menu VALUES (4, 10);
INSERT INTO restaurant_menu VALUES (4, 11);
INSERT INTO restaurant_menu VALUES (4, 14);
INSERT INTO restaurant_menu VALUES (4, 15);
INSERT INTO restaurant_menu VALUES (4, 17);
INSERT INTO restaurant_menu VALUES (4, 18);
INSERT INTO restaurant_menu VALUES (4, 19);
-- Taza Express Items --
INSERT INTO restaurant_menu VALUES (5, 12);
INSERT INTO restaurant_menu VALUES (5, 13);
INSERT INTO restaurant_menu VALUES (5, 14);
INSERT INTO restaurant_menu VALUES (5, 15);
INSERT INTO restaurant_menu VALUES (5, 17);
INSERT INTO restaurant_menu VALUES (5, 18);
INSERT INTO restaurant_menu VALUES (5, 19);

-- INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, authorities, access_token_validity, refresh_token_validity)
-- VALUES ('testjwtclientid', 'XY7kmzoNzl100', 'read,write', 'password,refresh_token,client_credentials,authorization_code', 'ROLE_USER', 900, 2592000);
INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, authorities, access_token_validity, refresh_token_validity)
VALUES ('jwtclientid', '$2a$10$966iITtwhskVodTYyZVrXuZME74qodZfj5jpYC0F3fbqYognLNI2y', 'read,write', 'password,refresh_token,client_credentials,authorization_code', 'ROLE_USER', 900, 2592000);
