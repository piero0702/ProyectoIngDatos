-- migrate:up

INSERT INTO colores (id,nombres) VALUES
    (1, 'Manu'),
    (2, 'White Marble'),
    (3, 'Lemon'),
    (4, 'Sky Blue'),
    (5, 'Amber'),
    (6, 'Maras'),
    (7, 'Curitiba'),
    (8, 'Navy Blue'),
    (9, 'Terracota'),
    (10, 'Lima'),
    (11, 'Bariloche'),
    (12, 'Máncora'),
    (13, 'Ombre Blue Light'),
    (14, 'Ombre Sky'),
    (15, 'Ombre Lila'),
    (16, 'Ombre Water'),
    (17, 'Coral'),
    (18, 'Baja Sand'),
    (19, 'Lila'),
    (20, 'Salinas'),
    (21, 'Canopi'),
    (22, 'Aqua'),
    (23, 'Midnight'),
    (24 , 'Pampilla');

-- migrate:down

DELETE FROM colores