-- migrate:up

INSERT INTO tipos (id, nombres) VALUES
    (1, 'Bottles'),
    (2, 'Sport'),
    (3, 'Cups'),
    (4, 'Pet'),
    (5, 'Ceramic'),
    (6, 'Mug');

-- migrate:down

DELETE FROM tipos