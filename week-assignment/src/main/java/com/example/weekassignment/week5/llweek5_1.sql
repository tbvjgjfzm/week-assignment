-- CREATE DATABASE BulletinBoard;
USE BulletinBoard;

-- 데이터베이스 초기 설정
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL,
    Status ENUM('active', 'banned', 'inactive') DEFAULT 'active'
);

CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Content TEXT NOT NULL,
    PostDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastEdited TIMESTAMP NULL,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT NOT NULL,
    MemberID INT NOT NULL,
    CommentText TEXT NOT NULL,
    CommentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- 데이터 삽입 (Create)
-- Members 데이터 삽입
INSERT INTO Members (Username, Password, Email, JoinDate, Status) VALUES
('alice', 'password123', 'alice@example.com', '2023-01-01', 'active'),
('bob', 'password456', 'bob@example.com', '2023-02-01', 'active'),
('charlie', 'password789', 'charlie@example.com', '2023-03-01', 'inactive');

-- Posts 데이터 삽입
INSERT INTO Posts (MemberID, Title, Content, PostDate) VALUES
(1, 'First Post', 'This is the first post.', '2023-04-01'),
(2, 'Second Post', 'This is the second post.', '2023-04-02');

-- Comments 데이터 삽입
INSERT INTO Comments (PostID, MemberID, CommentText, CommentDate) VALUES
(1, 2, 'Great post!', '2023-04-03'),
(2, 1, 'Thanks for sharing.', '2023-04-04');

-- Members 테이블 조회
SELECT * FROM Members;

-- Posts 테이블 조회
SELECT * FROM Posts;

-- Comments 테이블 조회
SELECT * FROM Comments;

-- Charlie 회원 삭제
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Members
WHERE Username = 'charlie';

-- Alice의 이메일 주소 업데이트
SET SQL_SAFE_UPDATES = 0;
UPDATE Members
SET Email = 'alice_new@example.com'
WHERE Username = 'alice';
SET SQL_SAFE_UPDATES = 1;


-- 조인 (JOIN)으로 조회하기
-- 1. INNER JOIN
SELECT Members.Username, Posts.Title, Comments.CommentText
FROM Members
INNER JOIN Posts ON Members.MemberID = Posts.MemberID
INNER JOIN Comments ON Posts.PostID = Comments.PostID;

-- 2. LEFT JOIN
SELECT Members.Username, Posts.Title
FROM Members
LEFT JOIN Posts ON Members.MemberID = Posts.MemberID;

-- 3. RIGHT JOIN
SELECT Posts.Title, Members.Username
FROM Posts
RIGHT JOIN Members ON Members.MemberID = Posts.MemberID;

-- 4. FULL JOIN
SELECT Members.Username, Posts.Title
FROM Members
LEFT JOIN Posts ON Members.MemberID = Posts.MemberID
UNION
SELECT Members.Username, Posts.Title
FROM Posts
RIGHT JOIN Members ON Members.MemberID = Posts.MemberID;

