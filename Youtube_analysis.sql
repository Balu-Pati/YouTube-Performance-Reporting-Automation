/* =====================================================
   YouTube Reporting Automation - SQL Workflow
   ===================================================== */

# Select Database to create table schema
use youtube_analysis;

#Create Table Comment
CREATE TABLE COMMENT(
S_no int,
Video_ID varchar(255),
Likes int,
Sentiment int);
select * from comment;
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

#Load csv file into the table created in the youtube_analysis Database
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/comment.csv"
INTO TABLE comment
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

# Second table
#Create table videos
CREATE TABLE videos (
    video_id VARCHAR(50),
    title TEXT,
    published VARCHAR(50),
    views VARCHAR(50),
    likes VARCHAR(50),
    comments VARCHAR(50)
) CHARACTER SET utf8mb4;

#load the csv file into videos Table which is in youtube_analysis Database
LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/videos.csv'
INTO TABLE videos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(video_id, title, published, views, likes, comments);

rename table videos_clean to video;
select * from video;
SELECT COUNT(*) FROM video;
SELECT COUNT(*) FROM comment;
SELECT * FROM video LIMIT 5;
SELECT * FROM comment LIMIT 5;

#Data Quality checks
# NUll Values
SELECT COUNT(*) FROM video WHERE video_id IS NULL;

#Negative values
SELECT * FROM video WHERE views < 0;

#Duplicate videos
SELECT video_id, COUNT(*)
FROM video
GROUP BY video_id
HAVING COUNT(*) > 1;

#create view to stored SQL query that behaves like a table (Optional).
CREATE VIEW video_engagement AS
SELECT
    v.video_id,
    v.title,
    v.views,
    v.likes,
    v.comments,
    v.Published,
    v.keyword,
    COUNT(c.video_id) AS total_comments,
    AVG(c.sentiment) AS avg_sentiment
FROM video v
LEFT JOIN comment c
ON v.video_id = c.video_id
GROUP BY
    v.video_id,
    v.title,
    v.views,
    v.likes,
    v.comments,
    v.Published,
    v.keyword;

select * from video_engagement;
   
# Top Performing Videos
CREATE VIEW top_videos AS
SELECT title, views
FROM video
ORDER BY views DESC;

select * from top_videos;

# Sentiment Performance
CREATE VIEW sentiment_summary AS
SELECT
    video_id,
    AVG(sentiment) AS sentiment_score
FROM comment
GROUP BY video_id;

#Monthly Performance
CREATE VIEW monthly_performance AS
SELECT
    published,
    SUM(views) total_views,
    SUM(likes) total_likes
FROM video
GROUP BY published;

# End of Query workflow....
