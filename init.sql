CREATE TABLE IF NOT EXISTS Place (
	id serial PRIMARY KEY,
	coordinates INTEGER[2],
	name TEXT
);

CREATE TABLE IF NOT EXISTS Entity (
	id serial PRIMARY KEY,
	place_id INTEGER REFERENCES Place (id),
	type INTEGER,
	name TEXT
);

CREATE TABLE IF NOT EXISTS Cataclysm (
	id serial PRIMARY KEY,
	name TEXT,
	strength INTEGER
);

CREATE TABLE IF NOT EXISTS Action (
	id serial PRIMARY KEY,
	place_id INTEGER REFERENCES Place (id),
	type INTEGER
);

CREATE TABLE IF NOT EXISTS Structure (
	id serial PRIMARY KEY,
	place_id INTEGER REFERENCES Place (id),
	name TEXT,
	age INTEGER
);

CREATE TABLE IF NOT EXISTS Owner (
	id serial PRIMARY KEY,
	money INTEGER
);

CREATE TABLE IF NOT EXISTS CataclysmToAction (
	id serial PRIMARY KEY,
	cataclysm_id INTEGER REFERENCES Cataclysm (id),
	action_id INTEGER REFERENCES Action (id)
);

CREATE TABLE IF NOT EXISTS EntityToAction (
	id serial PRIMARY KEY,
	entity_id INTEGER REFERENCES Entity (id),
	action_id INTEGER REFERENCES Action (id)
);

CREATE TABLE IF NOT EXISTS PlaceToAction (
	id serial PRIMARY KEY,
	place_id INTEGER REFERENCES Place (id),
	action_id INTEGER REFERENCES Action (id)
);

CREATE TABLE IF NOT EXISTS StructureToAction (
	id serial PRIMARY KEY,
	structure_id INTEGER REFERENCES Structure (id),
	action_id INTEGER REFERENCES Action (id)
);

CREATE TABLE IF NOT EXISTS StructureToOwner (
	id serial PRIMARY KEY,
	structure_id INTEGER REFERENCES Structure (id),
	owner_id INTEGER REFERENCES Owner (id)
);


INSERT INTO Place (coordinates, name)
VALUES (ARRAY [0, 0], 'Шалмирейн');

INSERT INTO Cataclysm (name, strength)
VALUES ('Наводнение', 10);

INSERT INTO Entity (place_id, type, name)
VALUES (1, 1, 'Червяк');

INSERT INTO Action (place_id, type)
VALUES (1, 1);

INSERT INTO Structure (place_id, name, age)
VALUES (1, 'Город', 1);

INSERT INTO Owner (money)
VALUES (1000);


INSERT INTO CataclysmToAction (cataclysm_id, action_id)
VALUES (1, 1);

INSERT INTO EntityToAction (entity_id, action_id)
VALUES (1, 1);

INSERT INTO PlaceToAction (place_id, action_id)
VALUES (1, 1);

INSERT INTO StructureToAction (structure_id, action_id)
VALUES (1, 1);

INSERT INTO StructureToOwner (structure_id, owner_id)
VALUES (1, 1);


