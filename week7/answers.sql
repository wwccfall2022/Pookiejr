-- Create your tables, views, functions and procedures here!
CREATE SCHEMA destruction;
USE destruction;

CREATE TABLE players (
	player_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
    	last_name VARCHAR(30) NOT NULL,
   	email VARCHAR(50) NOT NULL
);

CREATE TABLE characters ( 
	character_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    	player_id INT UNSIGNED NOT NULL,
    	name VARCHAR(30) NOT NULL,
    	level TINYINT UNSIGNED NOT NULL,
   	CONSTRAINT characters_fk_players
		FOREIGN KEY (player_id)
		REFERENCES players(player_id)
            	ON UPDATE CASCADE
           	ON DELETE CASCADE
);

CREATE TABLE winners (
	character_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    	name VARCHAR(30) NOT NULL,
    	CONSTRAINT winners_fk_characters
		FOREIGN KEY (character_id)
		REFERENCES characters (character_id)
		ON UPDATE CASCADE
            	ON DELETE CASCADE

);

CREATE TABLE character_stats (
	character_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    	health INT DEFAULT 0,
   	armor INT UNSIGNED DEFAULT 0,
    	CONSTRAINT character_stats_fk_players
		FOREIGN KEY (character_id)
		REFERENCES characters (character_id)
            	ON UPDATE CASCADE
            	ON DELETE CASCADE
);

CREATE TABLE teams (
	team_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    	name VARCHAR(30) NOT NULL 
);

CREATE TABLE team_members (
	team_member_id  INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
   	team_id INT UNSIGNED NOT NULL,
    	character_id INT UNSIGNED NOT NULL,
    	CONSTRAINT team_members_fk_teams
		FOREIGN KEY (team_id) 
        	REFERENCES teams (team_id)
        	ON UPDATE CASCADE
		ON DELETE CASCADE,
        
	CONSTRAINT team_members_fk_characters
	FOREIGN KEY (character_id) 
        REFERENCES characters (character_id)
        	ON UPDATE CASCADE
		ON DELETE CASCADE
        
);

CREATE TABLE items (
	item_id  INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  	name VARCHAR(30) NOT NULL,
    	armor INT UNSIGNED DEFAULT 0,
    	damage INT UNSIGNED DEFAULT 0
    
);

CREATE TABLE inventory (
	inventory_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    	character_id INT UNSIGNED NOT NULL,
    	item_id INT UNSIGNED NOT NULL,
     	CONSTRAINT inventory_fk_characters
		FOREIGN KEY (character_id) 
        	REFERENCES characters (character_id)
        	ON UPDATE CASCADE
		ON DELETE CASCADE,
        
	CONSTRAINT inventory_fk_items
		FOREIGN KEY (item_id) 
        	REFERENCES items (item_id)
        	ON UPDATE CASCADE
		ON DELETE CASCADE
        
);

CREATE TABLE equipped (
	equipped_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	character_id INT UNSIGNED NOT NULL,
    	item_id INT UNSIGNED NOT NULL,
     	CONSTRAINT equipped_fk_characters
		FOREIGN KEY (character_id) 
       		REFERENCES characters (character_id)
        	ON UPDATE CASCADE
		ON DELETE CASCADE,
        
	CONSTRAINT equipped_fk_items
	FOREIGN KEY (item_id) 
        REFERENCES items (item_id)
        ON UPDATE CASCADE
	ON DELETE CASCADE
    
);


INSERT INTO players
    (player_id, first_name, last_name, email)
VALUES
    (1, 'Terry', 'Pratchett', 'writer@disc.world'),
    (2, 'Neil', 'Gaiman', 'american@gods.com'),
    (3, 'George', 'Martin', 'game@thrones.of'),
    (4, 'J.R.R.', 'Tolkien', 'lord@the.rings');

INSERT INTO characters
    (character_id, player_id, name, level)
VALUES
    (1, 1, 'Death', 1),
    (2, 1, 'Susan', 1),
    (3, 1, 'Rincewind', 1),
    (4, 2, 'Shadow', 1),
    (5, 2, 'Wednesday', 1),
    (6, 2, 'Mr. Nancy', 1),
    (7, 3, 'Jon Snow', 1),
    (8, 3, 'Daenerys Targaryen', 1),
    (9, 3, 'Arya Stark', 1),
    (10, 4, 'Frodo Baggins', 1),
    (11, 4, 'Gandalf', 1),
    (12, 4, 'Gollum', 1);

INSERT INTO character_stats
    (character_id, health, armor)
VALUES
    (1, 20, 4),
    (2, 10, 2),
    (3, 8, 1),
    (4, 15, 3),
    (5, 12, 2),
    (6, 10, 1),
    (7, 15, 2),
    (8, 12, 2),
    (9, 10, 1),
    (10, 14, 1),
    (11, 12, 2),
    (12, 8, 1);

INSERT INTO teams
    (team_id, name)
VALUES
    (1, 'The Watchers'),
    (2, 'The Ankh-Morpork City Watch'),
    (3, 'The Fellowship of the Ring');

INSERT INTO team_members
    (team_id, character_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (1, 7),
    (3, 8),
    (3, 9),
    (3, 10),
    (3, 11),
    (3, 12);

INSERT INTO items
    (item_id, name, armor, damage)
VALUES
    (1, 'dagger', 0, 8),
    (2, 'sword', 1, 13),
    (3, 'shield', 2, 0),
    (4, 'helmet', 1, 0),
    (5, 'chainmail', 3, 0),
    (6, 'leather armor', 2, 0),
    (7, 'longbow', 0, 11),
    (8, 'shortbow', 0, 9),
    (9, 'crossbow', 0, 7);

INSERT INTO inventory
    (inventory_id, character_id, item_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 6),
    (7, 1, 7),
    (8, 1, 8),
    (9, 1, 9),
    (12, 2, 1),
    (13, 2, 2),
    (14, 2, 3),
    (15, 2, 4),
    (16, 2, 5),
    (17, 2, 6),
    (18, 2, 7),
    (19, 2, 8),
    (20, 2, 9),
    (23, 3, 1),
    (24, 3, 2),
    (25, 3, 3),
    (26, 3, 4),
    (27, 3, 5),
    (28, 3, 6),
    (29, 3, 7),
    (30, 3, 8),
    (31, 3, 9),
    (34, 4, 1),
    (35, 4, 2),
    (36, 4, 3),
    (37, 4, 4),
    (38, 4, 5),
    (39, 4, 6),
    (40, 4, 7),
    (41, 4, 8),
    (42, 4, 9),
    (45, 5, 1),
    (46, 5, 2),
    (47, 5, 3),
    (48, 5, 4),
    (49, 5, 5),
    (50, 5, 6),
    (51, 5, 7),
    (52, 5, 8),
    (53, 5, 9),
    (56, 6, 1),
    (57, 6, 2),
    (58, 6, 3),
    (59, 6, 4),
    (60, 6, 5),
    (61, 6, 6),
    (62, 6, 7),
    (63, 6, 8),
    (64, 6, 9),
    (67, 7, 1),
    (72, 7, 4),
    (73, 7, 7),
    (78, 8, 1),
    (79, 8, 2),
    (80, 8, 3),
    (81, 8, 4),
    (82, 8, 5),
    (83, 8, 6),
    (84, 8, 7),
    (85, 8, 8),
    (89, 9, 1),
    (90, 9, 2),
    (91, 9, 3),
    (92, 9, 4),
    (93, 9, 5),
    (94, 9, 6),
    (95, 9, 7),
    (96, 9, 8),
    (100, 10, 4),
    (101, 10, 5);

INSERT INTO equipped
    (equipped_id, character_id, item_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 6),
    (7, 1, 7),
    (8, 1, 8),
    (9, 1, 9),
    (12, 2, 1),
    (13, 2, 2),
    (14, 2, 3),
    (15, 2, 4),
    (16, 2, 5),
    (17, 2, 6),
    (18, 2, 7),
    (19, 2, 8),
    (20, 2, 9),
    (23, 3, 1),
    (24, 3, 2),
    (25, 3, 3),
    (26, 3, 4),
    (27, 3, 5),
    (28, 3, 6),
    (29, 3, 7),
    (30, 3, 8),
    (31, 3, 9),
    (34, 4, 1),
    (35, 4, 2),
    (36, 4, 3),
    (37, 4, 4),
    (38, 4, 5),
    (39, 4, 6),
    (40, 4, 7),
    (41, 4, 8),
    (42, 4, 9),
    (45, 5, 1),
    (46, 5, 2),
    (47, 5, 3),
    (48, 5, 4),
    (49, 5, 5),
    (50, 5, 6),
    (51, 5, 7),
    (52, 5, 8),
    (53, 5, 9),
    (56, 6, 1),
    (57, 6, 2),
    (58, 6, 3),
    (59, 6, 4),
    (60, 6, 5),
    (61, 6, 6),
    (62, 6, 7),
    (63, 6, 8),
    (64, 6, 9),
    (68, 7, 2),
    (72, 7, 6),
    (78, 8, 1),
    (79, 8, 2),
    (80, 8, 3),
    (81, 8, 4),
    (82, 8, 5),
    (83, 8, 6),
    (84, 8, 7),
    (85, 8, 8),
    (89, 9, 1),
    (90, 9, 2),
    (91, 9, 3),
    (92, 9, 4),
    (93, 9, 5),
    (94, 9, 6),
    (95, 9, 7),
    (96, 9, 8),
    (100, 10, 1);
    
CREATE OR REPLACE VIEW character_items AS
SELECT c.character_id, c.name AS character_name, i.name AS item_name, i.armor , i.damage
FROM characters c
    INNER JOIN inventory iv
    ON c.character_id = iv.character_id
    INNER JOIN items i
    ON iv.item_id = i.item_id
    UNION 
    SELECT c.character_id, c.name AS character_name, i.name AS item_name, i.armor , i.damage
    FROM characters c
    INNER JOIN equipped e
    ON c.character_id = e.character_id
    INNER JOIN items i
    ON e.item_id = i.item_id 
    ORDER BY character_name, item_name;
    
CREATE OR REPLACE VIEW team_items AS
    SELECT t.team_id, t.name AS team_name, i.name AS item_name, i.armor , i.damage
    FROM teams t
    INNER JOIN team_members te
    ON t.team_id = te.team_id
    INNER JOIN characters c
    ON c.character_id = te.character_id
    INNER JOIN inventory iv
    ON c.character_id = iv.character_id
    INNER JOIN items i
    ON iv.item_id = i.item_id
    UNION 
    SELECT t.team_id, t.name AS team_name, i.name AS item_name, i.armor , i.damage
    FROM teams t
    INNER JOIN team_members te
    ON t.team_id = te.team_id
    INNER JOIN characters c
    ON c.character_id = te.character_id
    INNER JOIN equipped e
    ON c.character_id = e.character_id
    INNER JOIN items i
    ON e.item_id = i.item_id 
    ORDER BY team_name, item_name;
    
DELIMITER ;;
    CREATE FUNCTION armor_total(id INT UNSIGNED)
    RETURNS INT UNSIGNED 
    DETERMINISTIC 
    BEGIN 
    DEClARE character_armor INT UNSIGNED;
    DEClARE equipped_armor INT UNSIGNED;
    DECLARE total_armor INT UNSIGNED;

    SELECT armor  INTO character_armor
    FROM character_stats 
    WHERE character_id = id;

    SELECT SUM(i.armor) INTO equipped_armor 
    FROM items i
    LEFT OUTER JOIN equipped e
    ON e.item_id = i.item_id
    WHERE e.character_id = id;

    SET total_armor = character_armor + equipped_armor;
        RETURN total_armor;

    END;; 
     

CREATE PROCEDURE attack(attacked_character_id INT UNSIGNED, equipped_id INT UNSIGNED)

BEGIN
DECLARE armor INT UNSIGNED;
DECLARE damage INT UNSIGNED;
DECLARE total_damage INT;
DECLARE new_health INT;
DECLARE total_health INT;


SELECT armor_total(attacked_character_id) INTO armor;

SELECT i.damage INTO damage 
    FROM items i
    INNER JOIN equipped e
    ON e.item_id = i.item_id
    WHERE e.equipped_id = equipped_id;

SET total_damage = damage - armor;


SELECT health INTO new_health
    FROM character_stats
    WHERE character_id = attacked_character_id ;


IF total_damage >0 THEN 

    SET total_health = new_health - total_damage;
    UPDATE character_stats SET health = total_health WHERE character_id = attacked_character_id;

    IF  total_damage >= new_health THEN
    DELETE FROM characters WHERE character_id = attacked_character_id;
    END IF;
END IF;


END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE equip (item_inventory_id INT UNSIGNED)
BEGIN
DECLARE item INT UNSIGNED;
DECLARE id_character INT UNSIGNED;
DECLARE new_item INT UNSIGNED;
DECLARE new_character INT UNSIGNED;

SELECT item_id INTO item
FROM inventory
WHERE inventory_id = item_inventory_id;

SELECT item_id INTO new_item
FROM items 
WHERE item_id = item;

SELECT character_id INTO id_character
FROM inventory
WHERE inventory_id = item_inventory_id;

SELECT character_id INTO new_character
FROM characters 
WHERE character_id = id_character;

DELETE FROM inventory WHERE inventory_id = item_inventory_id;

INSERT INTO equipped (character_id, item_id) VALUES (new_character, new_item);
END;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE unequip (item_equipped_id INT UNSIGNED)
BEGIN
DECLARE item INT UNSIGNED;
DECLARE id_character INT UNSIGNED;
DECLARE new_item INT UNSIGNED;
DECLARE new_character INT UNSIGNED;

SELECT item_id INTO item
FROM equipped
WHERE equipped_id = item_equipped_id;

SELECT item_id INTO new_item
FROM items
WHERE item_id = item;

SELECT character_id INTO id_character
FROM equipped
WHERE equipped_id = item_equipped_id;

SELECT character_id INTO new_character
FROM characters
WHERE character_id = id_character;

DELETE FROM equipped WHERE equipped_id = item_equipped_id;


INSERT INTO inventory (character_id, item_id) VALUES (new_character,new_item );


END;;
DELIMITER;

DELIMITER ;;
CREATE PROCEDURE set_winners(id_team INT UNSIGNED)
BEGIN

DECLARE team INT UNSIGNED;
DECLARE id INT UNSIGNED;
DECLARE character_name VARCHAR(30);
DECLARE row_not_found TINYINT DEFAULT FALSE;



DECLARE team_cursor CURSOR FOR

SELECT c.character_id, c.name
FROM team_members t
INNER JOIN characters c
ON t.character_id = c.character_id
WHERE t.team_id = id_team;


DECLARE CONTINUE HANDLER FOR NOT FOUND
SET row_not_found = TRUE;


DELETE FROM winners;

OPEN team_cursor;
character_loop : LOOP

FETCH team_cursor INTO id, character_name;

IF row_not_found THEN
LEAVE character_loop;
END IF;

INSERT INTO winners
(character_id , name)
VALUES
(id, character_name);

END LOOP character_loop;


CLOSE team_cursor;

END;;
DELIMITER ;
