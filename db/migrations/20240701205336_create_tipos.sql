-- migrate:up

CREATE TABLE tipos (
    id INTEGER PRIMARY KEY,
    nombres VARCHAR(50)
);
-- migrate:down
DROP TABLE tipos;