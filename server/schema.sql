CREATE DATABASE todo_app;

USE todo_app;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255)
);

CREATE TABLE todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  completed BOOLEAN DEFAULT false,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  todo_id INT,
  user_id INT NOT NULL,
  shared_with_id INT,
  FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert two users into the users table

INSERT INTO users (name, email, password) VALUES ('Julian', 'julian.berardinelli@gmail.com', 'password1');
INSERT INTO users (name, email, password) VALUES ('Christian', 'christian.berardinelli@gmail.com', 'password2');

-- Insert a todo for each user
INSERT INTO todos (title, user_id) 
VALUES
    ('Buy groceries 🛒', 1),
    ('Exercise 💪', 1),
    ('Call a friend 📞', 1),
    ('House cleaning 🧹', 1),
    ('Study for exam 📚', 1),
    ('Prepare dinner 🍲', 1),
    ('Go to the gym 🏋️‍♂️', 1),
    ('Walk the dog 🐕', 1),
    ('Watch a movie 🎬', 1),
    ('Take a hike 🚶‍♂️', 1),
    ('Read a book 📖', 1);

-- Insert todo 1 user 1 whit user 2
INSERT INTO shared_todos (todo_id, user_id, shared_with_id) 
VALUES (2, 1, 2);

-- Get todos including shared todos by id

SELECT todos.*, shared_todos.shared_with_id
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];
```