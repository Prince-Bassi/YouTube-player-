CREATE DATABASE IF NOT EXISTS youtube_player;
USE youtube_player;

CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    videoId VARCHAR(20) NOT NULL UNIQUE,
    title TEXT NOT NULL,
    thumbnails JSON NOT NULL
);

CREATE TABLE playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE playlist_videos (
    playlistId INT NOT NULL,
    videoId INT NOT NULL,

    PRIMARY KEY (playlistId, videoId),

    FOREIGN KEY (playlistId)
        REFERENCES playlists(id)
        ON DELETE CASCADE,

    FOREIGN KEY (videoId)
        REFERENCES videos(id)
        ON DELETE CASCADE
);