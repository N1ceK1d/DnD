CREATE TABLE Races (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    img LONGTEXT NOT NULL,
    description LONGTEXT NOT NULL,
    base_speed INT NOT NULL
);

CREATE TABLE Classes (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    img LONGTEXT NOT NULL
);
CREATE TABLE Languages (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE RacesLanguages (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    race_id INT NOT NULL,
    language_id INT NOT NULL,
    FOREIGN KEY (race_id) REFERENCES Races(id),
    FOREIGN KEY (language_id) REFERENCES Languages(id)
);

CREATE TABLE Parties (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Genders (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Characters (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    race_id INT NOT NULL,
    gender_id INT NOT NULL,
    class_id INT NOT NULL,
    age INT NOT NULL,
    speed INT NOT NULL,
    level INT NOT NULL,
    FOREIGN KEY (race_id) REFERENCES Races(id),
    FOREIGN KEY (gender_id) REFERENCES Genders(id),
    FOREIGN KEY (class_id) REFERENCES Classes(id)
);

CREATE TABLE Sizes (
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(255) NOT NULL
);

CREATE TABLE Cityes (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    size_id INT NOT NULL,
    FOREIGN KEY (size_id) REFERENCES Sizes(id)
);