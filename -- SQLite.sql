-- SQLite
-- Таблица магазинов
CREATE TABLE shop (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT NOT NULL
);

-- Таблица продуктов
CREATE TABLE product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    count INTEGER DEFAULT 0,
    shop_id INTEGER,
    FOREIGN KEY(shop_id) REFERENCES shop(id)
);

-- Таблица покупателей
CREATE TABLE client (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phone TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL
);

-- Таблица заказов
CREATE TABLE "order" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    client_id INTEGER,
    shop_id INTEGER,
    FOREIGN KEY(client_id) REFERENCES client(id),
    FOREIGN KEY(shop_id) REFERENCES shop(id)
);

-- Таблица соответствия продуктов и заказов
CREATE TABLE order_product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    price REAL NOT NULL,
    quantity INTEGER DEFAULT 1,
    FOREIGN KEY(order_id) REFERENCES "order"(id),
    FOREIGN KEY(product_id) REFERENCES product(id)
);

-- Заполнение таблицы магазины
INSERT INTO shop (name, address) VALUES ('Магазин 1', 'Адрес 1');
INSERT INTO shop (name, address) VALUES ('Магазин 2', 'Адрес 2');
INSERT INTO shop (name, address) VALUES ('Магазин 3', 'Адрес 3');
INSERT INTO shop (name, address) VALUES ('Магазин 4', 'Адрес 4');
INSERT INTO shop (name, address) VALUES ('Магазин 5', 'Адрес 5');

-- Заполнение таблицы продукты
INSERT INTO product (name, price, count, shop_id) 
VALUES ('Продукт 1', 100.00, 10, 1);
INSERT INTO product (name, price, count, shop_id) 
VALUES ('Продукт 2', 200.00, 20, 1);
INSERT INTO product (name, price, count, shop_id) 
VALUES ('Продукт 3', 300.00, 30, 2);
INSERT INTO product (name, price, count, shop_id) 
VALUES ('Продукт 4', 400.00, 40, 2);
INSERT INTO product (name, price, count, shop_id) 
VALUES ('Продукт 5', 500.00, 50, 3);

-- Заполнение таблицы покупатели
INSERT INTO client (phone, name) VALUES ('+70000000001', 'Покупатель 1');
INSERT INTO client (phone, name) VALUES ('+70000000002', 'Покупатель 2');
INSERT INTO client (phone, name) VALUES ('+70000000003', 'Покупатель 3');
INSERT INTO client (phone, name) VALUES ('+70000000004', 'Покупатель 4');
INSERT INTO client (phone, name) VALUES ('+70000000005', 'Покупатель 5');

-- Заполнение таблицы заказы
INSERT INTO "order" (client_id, shop_id) VALUES (1, 1);
INSERT INTO "order" (client_id, shop_id) VALUES (2, 2);
INSERT INTO "order" (client_id, shop_id) VALUES (3, 3);
INSERT INTO "order" (client_id, shop_id) VALUES (4, 4);
INSERT INTO "order" (client_id, shop_id) VALUES (5, 5);

-- Заполнение таблицы соответствия продуктов и заказов
INSERT INTO order_product (order_id, product_id, price, quantity) 
VALUES (1, 1, 100.00, 2);
INSERT INTO order_product (order_id, product_id, price, quantity) 
VALUES (2, 2, 200.00, 3);
INSERT INTO order_product (order_id, product_id, price, quantity) 
VALUES (3, 3, 300.00, 4);
INSERT INTO order_product (order_id, product_id, price, quantity) 
VALUES (4, 4, 400.00, 5);
INSERT INTO order_product (order_id, product_id, price, quantity) 
VALUES (5, 5, 500.00, 6);

