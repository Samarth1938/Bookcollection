CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL
);

CREATE TABLE Genres (
  GenreID INT PRIMARY KEY,
  GenreName VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(200) NOT NULL,
  AuthorID INT,
  GenreID INT,
  PublicationYear INT,
  ISBN VARCHAR(20),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
  FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE ReadingStatus (
  ReadingStatusID INT PRIMARY KEY,
  BookID INT,
  Status VARCHAR(50) NOT NULL CHECK(Status IN ('To Read', 'Currently Reading', 'Finished')),
  FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES
  (1, 'J.K.', 'Rowling'),
  (2, 'J.R.R.', 'Tolkien'),
  (3, 'George R.R.', 'Martin');

INSERT INTO Genres (GenreID, GenreName)
VALUES
  (1, 'Fantasy'),
  (2, 'Science Fiction'),
  (3, 'Mystery');

INSERT INTO Books (BookID, Title, AuthorID, GenreID, PublicationYear, ISBN)
VALUES
  (1, 'Harry Potter and the Philosopher\'s Stone', 1, 1, 1997, '9780747532699'),
  (2, 'The Lord of the Rings', 2, 1, 1954, '9780261102385'),
  (3, 'A Game of Thrones', 3, 1, 1996, '9780553386790');

INSERT INTO ReadingStatus (ReadingStatusID, BookID, Status)
VALUES
  (1, 1, 'Finished'),
  (2, 2, 'To Read'),
  (3, 3, 'Currently Reading');

-- Get all books by a specific author
SELECT * FROM Books WHERE AuthorID = 1;

-- Get all books in a specific genre
SELECT * FROM Books WHERE GenreID = 1;

-- Get the reading status of a specific book
SELECT * FROM ReadingStatus WHERE BookID = 1;

-- Update the reading status of a book
UPDATE ReadingStatus SET Status = 'Finished' WHERE BookID = 3;