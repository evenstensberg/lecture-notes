
/* BEGIN;

PRAGMA temp_store = 2;
CREATE TEMP TABLE _Variables(Name TEXT PRIMARY KEY, RealValue REAL, IntegerValue INTEGER, BlobValue BLOB, TextValue TEXT);


END; */

CREATE TABLE users(
    uniq_id INTEGER,
    first_name VARCHAR,
    last_name VARCHAR,
    age INTEGER,
    interests VARCHAR(20)
);

/* Rename */
ALTER TABLE users RENAME TO notUsers;


/* Add column, sql doesn't have bools, so 0 = nay, 1 = yay */
ALTER TABLE notUsers ADD COLUMN isLit INTEGER;

/* Insert into table */
INSERT INTO notUsers (uniq_id, first_name, last_name, age, interests, isLit) VALUES (69, "Jeff", "HMM", 21, "Eat, Sleep, Code", 1);

/* Without params */
INSERT INTO notUsers VALUES(96, "Pingu", "The fish", 12, "Fishing, Swimming", 0);

/* Defaults 🙂 */
INSERT INTO notUsers DEFAULT VALUES;