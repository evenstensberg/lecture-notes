
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