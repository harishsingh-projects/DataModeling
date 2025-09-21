-- -----------------------------------------------------
-- P1 Solution
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`theatre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`theatre` (
  `thr_id` INT NOT NULL AUTO_INCREMENT,
  `thr_name` VARCHAR(100) NOT NULL,
  `thr_loc` VARCHAR(100) NULL,
  `total_screens` INT NULL,
  PRIMARY KEY (`thr_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie` (
  `mov_id` INT NOT NULL AUTO_INCREMENT,
  `mov_name` VARCHAR(100) NOT NULL,
  `mov_lang` VARCHAR(45) NULL,
  `mov_duration` INT NULL,
  `certificate` VARCHAR(45) NULL,
  `release_date` DATE NULL,
  PRIMARY KEY (`mov_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`screen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`screen` (
  `screen_id` INT NOT NULL AUTO_INCREMENT,
  `thr_id` INT NULL,
  `src_name` VARCHAR(100) NULL,
  `screen_type` VARCHAR(45) NULL,
  `scr_cap` INT NULL,
  PRIMARY KEY (`screen_id`),
  INDEX `thr_id_idx` (`thr_id` ASC) VISIBLE,
  CONSTRAINT `thr_id`
    FOREIGN KEY (`thr_id`)
    REFERENCES `mydb`.`theatre` (`thr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`show`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`show` (
  `show_id` INT NOT NULL AUTO_INCREMENT,
  `mov_id` INT NULL,
  `screen_id` INT NULL,
  `show_date` DATE NULL,
  `show_time` TIME NULL,
  `price` DECIMAL(8,2) NULL,
  PRIMARY KEY (`show_id`),
  INDEX `mov_id_idx` (`mov_id` ASC) VISIBLE,
  CONSTRAINT `mov_id`
    FOREIGN KEY (`mov_id`)
    REFERENCES `mydb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `screen_id`
    FOREIGN KEY (`screen_id`)
    REFERENCES `mydb`.`screen` (`screen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Movie (mov_id, mov_name, mov_lang, mov_duration, certificate, release_date) VALUES
(1, 'Jawan', 'Hindi', 165, 'UA', '2023-09-07'),
(2, 'Oppenheimer', 'English', 180, 'A', '2023-07-21'),
(3, 'Spider-Man: No Way Home', 'English', 148, 'UA', '2021-12-17'),
(4, 'Pathaan', 'Hindi', 160, 'UA', '2023-01-25');

INSERT INTO Theatre (thr_id, thr_name, thr_loc, total_screens) VALUES
(1, 'PVR Cinemas', 'Kolkata', 3),
(2, 'INOX City Centre', 'Delhi', 2,
(3, 'RAVE 3', 'Kanpur', 2);

INSERT INTO Screen (screen_id, thr_id, src_name, scr_cap, screen_type) VALUES
(1, 1, 'Screen 1', 200, '4K'),
(2, 1, 'Screen 2', 150, '3D'),
(3, 1, 'Screen 3', 120, '2D'),
(4, 2, 'Screen 1', 180, 'IMAX'),
(5, 2, 'Screen 2', 160, '2D');

INSERT INTO Shows (show_id, screen_id, mov_id, show_date, show_time, price) VALUES
-- PVR Cinemas
(1, 1, 1, '2025-09-22', '10:00:00', 300),  -- Jawan 4K
(2, 2, 1, '2025-09-22', '10:00:00', 350),  -- Jawan 3D
(3, 3, 1, '2025-09-22', '14:00:00', 250),  -- Jawan 2D
(4, 2, 4, '2025-09-22', '18:00:00', 320),  -- Pathaan 3D
-- INOX City Centre
(5, 4, 2, '2025-09-22', '11:00:00', 400),  -- Oppenheimer IMAX
(6, 5, 3, '2025-09-22', '15:00:00', 280);  -- Spider-Man 2D

commit;

-- -----------------------------------------------------
-- P2 Solution
-- -----------------------------------------------------

SELECT 
    t.thr_name,
    sc.src_name,
    sc.screen_type,
    m.mov_name,
    s.show_date,
    s.show_time,
    s.price
FROM Shows s
JOIN Screen sc ON s.screen_id = sc.screen_id
JOIN Theatre t ON sc.thr_id = t.thr_id
JOIN Movie m ON s.mov_id = m.mov_id
WHERE t.thr_name = 'PVR Cinemas'
  AND s.show_date = '2025-09-22';