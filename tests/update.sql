UPDATE foo SET x = 123;
-- error 42P01: no such table: FOO

CREATE TABLE foo (baz CHARACTER VARYING(10));
INSERT INTO foo (baz) VALUES ('hi');
INSERT INTO foo (baz) VALUES ('there');
UPDATE foo SET baz = 'hi';
UPDATE foo SET baz = 'other';
SELECT * FROM foo;
-- msg: CREATE TABLE 1
-- msg: INSERT 1
-- msg: INSERT 1
-- msg: UPDATE 1
-- msg: UPDATE 2
-- BAZ: other
-- BAZ: other

CREATE TABLE foo (baz FLOAT);
INSERT INTO foo (baz) VALUES (35);
INSERT INTO foo (baz) VALUES (78);
UPDATE foo SET baz = 100 WHERE baz = 35;
UPDATE foo SET baz = 100 WHERE baz = 100;
SELECT * FROM foo;
-- msg: CREATE TABLE 1
-- msg: INSERT 1
-- msg: INSERT 1
-- msg: UPDATE 1
-- msg: UPDATE 0
-- BAZ: 100
-- BAZ: 78

CREATE TABLE foo (baz FLOAT);
UPDATE foo SET baz = true;
-- msg: CREATE TABLE 1
-- error 42804: data type mismatch for column BAZ: expected DOUBLE PRECISION but got BOOLEAN

CREATE TABLE foo (baz FLOAT);
INSERT INTO foo (baz) VALUES (123);
UPDATE foo SET baz = NULL;
SELECT * FROM foo;
-- msg: CREATE TABLE 1
-- msg: INSERT 1
-- msg: UPDATE 1
-- BAZ: NULL

CREATE TABLE foo (baz FLOAT NOT NULL);
INSERT INTO foo (baz) VALUES (123);
UPDATE foo SET baz = NULL;
-- msg: CREATE TABLE 1
-- msg: INSERT 1
-- error 23502: violates non-null constraint: column BAZ

CREATE TABLE foo (baz FLOAT);
INSERT INTO foo (baz) VALUES (-123);
UPDATE foo SET baz = -223 * 4.2;
SELECT * FROM foo;
-- msg: CREATE TABLE 1
-- msg: INSERT 1
-- msg: UPDATE 1
-- BAZ: -936.6

CREATE TABLE foo (baz FLOAT);
INSERT INTO foo (baz) VALUES (-123);
UPDATE foo SET baz = baz * 4.2;
SELECT * FROM foo;
-- msg: CREATE TABLE 1
-- msg: INSERT 1
-- msg: UPDATE 1
-- BAZ: -516.6
