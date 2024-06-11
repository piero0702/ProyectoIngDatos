-- migrate:up

INSERT INTO tamanios (id, numeroMl) VALUES
    (1, 350),
    (2, 360),
    (3, 415),
    (4, 500),
    (5, 590),
    (6, 600),
    (7, 650),
    (8, 700),
    (9, 750),
    (10, 850),
    (11, 950),
    (12, 1200);
-- migrate:down

DELETE FROM tamanios;
