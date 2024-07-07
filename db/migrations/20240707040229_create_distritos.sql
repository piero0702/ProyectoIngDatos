-- migrate:up

CREATE TABLE distritos (
    id INTEGER PRIMARY KEY,
    nombres VARCHAR(50)
);
-- migrate:down
DROP TABLE distritos;