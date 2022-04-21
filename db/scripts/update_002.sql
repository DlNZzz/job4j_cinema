select * from users;
select * from sessions;
select * from ticket;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    phone VARCHAR NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS sessions (
    id SERIAL PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE IF NOT EXISTS tickets (
    id SERIAL PRIMARY KEY,
    session_id INT NOT NULL REFERENCES sessions (id),
    row_r INT NOT NULL,
    cell INT NOT NULL,
    user_id INT NOT NULL REFERENCES users (id)
);

ALTER TABLE tickets
    ADD CONSTRAINT constraint_ticket UNIQUE (session_id, row_r, cell);

INSERT INTO users (id, username, email, phone) VALUES (0, 'user', 'em', 'ph');
INSERT INTO sessions (id, name) VALUES (0, 'session');
INSERT INTO users (username, email, phone) VALUES ('user2', 'em3', 'ph3');
INSERT INTO sessions (name) VALUES ('session');
INSERT INTO tickets (session_id, row_r, cell, user_id) VALUES (0, 23, 3, 5);
INSERT INTO tickets (session_id, row_r, cell, user_id) VALUES (1, 23, 3, 8);
INSERT INTO tickets (session_id, row_r, cell, user_id) VALUES (2, 23, 3, 8);
INSERT INTO tickets (session_id, row_r, cell, user_id) VALUES (2, 23, 3, 10);

DELETE FROM users;
DELETE FROM tickets;
