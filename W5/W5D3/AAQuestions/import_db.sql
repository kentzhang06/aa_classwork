PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;

DROP TABLE IF EXISTS questions;

DROP TABLE IF EXISTS users;



CREATE TABLE users( 
  id INTEGER PRIMARY KEY, -- 1 2 3 4 5 6 7 8 9
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

-- DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
  id INTEGER PRIMARY KEY, -- 1 2 3 4 5 6 7 8 9
  title TEXT NOT NULL,
  body  TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,  -- 1 2 3 4 5 6 7 8 9
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id)
  
);


CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,  -- 1 2 3 4 5 6 7 8 9
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname,lname)
VALUES
  ('Kent','Zhang'),
  ('Tony','Zhang'),
  ('Joe', 'Mama'),
  ('Nem', 'Nguy'),
  ('Tony', 'Stark');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('Help', 'help please', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Mama')),
  ('Help me too', 'hurry up', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Mama')),
  ('Help me three', 'whats taking so long', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Mama')),
  ('How to cook', 'cook ramen', (SELECT id FROM users WHERE fname = 'Kent' AND lname = 'Zhang')),
  ('How to solve', 'cant figure it out', (SELECT id FROM users WHERE fname = 'Tony' AND lname = 'Zhang'));




INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Nem' AND lname = 'Nguy'),
  (SELECT id FROM questions WHERE title = 'Help')),

  ((SELECT id FROM users WHERE fname = 'Tony' AND lname = 'Zhang'),
  (SELECT id FROM questions WHERE title = 'Help')),

  ((SELECT id FROM users WHERE fname = 'Kent' AND lname = 'Zhang'),
  (SELECT id FROM questions WHERE title = 'Help')),

  ((SELECT id FROM users WHERE fname = 'Tony' AND lname = 'Stark'),
  (SELECT id FROM questions WHERE title = 'How to solve')),

  ((SELECT id FROM users WHERE fname = 'Tony' AND lname = 'Zhang'),
  (SELECT id FROM questions WHERE title = 'How to cook'));





INSERT INTO
  replies(question_id, parent_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'Help'), NULL,
  (SELECT id FROM users WHERE fname = 'Kent' AND lname = 'Zhang'),
  'How can you not know foo'),

  ((SELECT id FROM questions WHERE title = 'Help me too'), NULL,
  (SELECT id FROM users WHERE fname = 'Kent' AND lname = 'Zhang'),
  'please'),

  ((SELECT id FROM questions WHERE title = 'Help me too'),
  1,
  (SELECT id FROM users WHERE fname = 'Kent' AND lname = 'Zhang'),
  'woowowwowow'),


  ((SELECT id FROM questions WHERE title = 'Help me three'), NULL,
  (SELECT id FROM users WHERE fname = 'Kent' AND lname = 'Zhang'),
  'HOW CAN YOU DO THIS TO ME'),

  ((SELECT id FROM questions WHERE title = 'How to cook'), NULL,
  (SELECT id FROM users WHERE fname = 'Tony' AND lname = 'Zhang'),
  'Watch youtube dumass'),

  ((SELECT id FROM questions WHERE title = 'How to solve'), NULL,
  (SELECT id FROM users WHERE fname = 'Tony' AND lname = 'Stark'),
  'please help');





  INSERT INTO
    question_likes(user_id, question_id)
  VALUES
    ((SELECT id FROM users WHERE fname = 'Tony' AND lname = 'Stark'),
    (SELECT id FROM questions WHERE title = 'Help')),

    ((SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Mama'),
    (SELECT id FROM questions WHERE title = 'How to solve')),

    ((SELECT id FROM users WHERE fname = 'Kent' AND lname = 'Zhang'),
    (SELECT id FROM questions WHERE title = 'How to cook'));



