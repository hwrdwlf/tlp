CREATE USER 'master'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'master'@'localhost' WITH GRANT OPTION;
CREATE DATABASE tlp;
USE tlp;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    account_type TINYINT DEFAULT 0,
    force_pw_reset TINYINT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS images(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    location_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tags(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS image_tags(
    tag_id INT,
    image_id INT,
    INDEX img_tag_idx (tag_id, image_id)
);

INSERT INTO images(name,location_id) 
VALUES
    ('DSC02001.JPG',1),
    ('DSC02002.JPG',1),
    ('DSC02003.JPG',1),
    ('DSC02004.JPG',1),
    ('DSC02005.JPG',1),
    ('DSC02006.JPG',1),
    ('DSC02007.JPG',1),
    ('DSC02008.JPG',1),
    ('DSC02009.JPG',1),
    ('DSC02010.JPG',1),
    ('DSC02011.JPG',1),
    ('DSC02012.JPG',1),
    ('DSC02021.JPG',1),
    ('DSC02022.JPG',1),
    ('DSC02023.JPG',1),
    ('DSC02024.JPG',1),
    ('DSC02025.JPG',1),
    ('DSC02026.JPG',1),
    ('DSC02027.JPG',1),
    ('DSC02028.JPG',1),
    ('DSC02029.JPG',1),
    ('DSC02030.JPG',1),
    ('DSC02031.JPG',1);

INSERT INTO tags(name)
    VALUES
        ('dog'),
        ('coco'),
        ('toby'),
        ('person'),
        ('howard'),
        ('mike'),
        ('jungja'),
        ('hilary'),
        ('hannah');

INSERT INTO image_tags(image_id, tag_id)
    VALUES
        (1,1),
        (1,2),
        (2,1),
        (2,2),
        (3,1),
        (3,2),
        (4, 1),
        (4,2),
        (5, 1),
        (5,2),
        (6, 1),
        (6,2),
        (7, 1),
        (7,2),
        (8, 1),
        (8,2),
        (9, 1),
        (9,2),
        (10,1),
        (10,2),
        (11,1),
        (11,2),
        (12,1),
        (12,2),
        (13,1),
        (13,2),
        (13,3),
        (13,4),
        (13,9),
        (14,1),
        (14,2),
        (14,3),
        (14,4),
        (14,9),
        (15,1),
        (15,2),
        (15,3),
        (15,4),
        (15,9),
        (16,1),
        (16,2),
        (16,3),
        (16,4),
        (16,9),
        (17,1),
        (17,2),
        (17,3),
        (18,1),
        (18,2),
        (18,3),
        (19,1),
        (19,2),
        (19,3),
        (19,4),
        (19,9),
        (20,1),
        (20,2),
        (20,3),
        (20,4),
        (20,7),
        (21,1),
        (21,2),
        (21,3),
        (21,4),
        (21,7),
        (22,1),
        (22,2),
        (22,3),
        (22,4),
        (22,7),
        (23,1),
        (23,2),
        (23,3),
        (23,4),
        (23,7);


select images.name, created_at, group_concat(tags.name separator ',') from images 
join image_tags on images.id = image_tags.image_id
join tags on tags.id = image_tags.tag_id
where images.id = 13;