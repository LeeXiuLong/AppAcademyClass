DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

PRAGMA foreign_keys = ON;

--DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

-- DROP TABLE IF EXISTS questions

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
    --id INTEGER PRIMARY KEY,
    questions_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    subject_question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    users_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (subject_question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
    questions_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);


INSERT INTO 
    users(fname, lname)
VALUES
    ('Max', 'Steel'),
    ('Sarah', 'Smith'),
    ('Jane', 'Thompkins');

INSERT INTO
    questions(title, body, users_id)
VALUES
    ('How?', 'How do you do stuff dude?', (SELECT id FROM users WHERE fname = 'Max')),
    ('Likes?', 'How can I get a million likes. Nobody likes my pancakes?!', (SELECT id FROM users WHERE fname = 'Sarah')),
    ('When?', 'When does the world end? And if it''s soon does anything matter?!', (SELECT id FROM users WHERE fname = 'Jane')); 

INSERT INTO
    replies(subject_question_id, parent_reply_id, users_id, body)
VALUES
    (1, NULL , 3, 'Just make an effort... or don''t, nothing matters'),
    (1, 1, 2, 'omg just like my post already!'),
    (2, NULL, 1, 'this recipe is dope!'), 
    (2, 3, 3, 'Max she has a girlfriend...');

INSERT INTO
    question_follows(questions_id, users_id)
VALUES
        (1, 1),
        (2, 2),
        (3, 3),
        (2, 1);

INSERT INTO
    question_likes(questions_id, users_id)
VALUES
    (1, 1),
    (2, 1),
    (2, 2),
    (2, 3);