CREATE DATABASE IF NOT EXISTS dbReLife
	CHARACTER SET = 'utf8'
	COLLATE = 'utf8_unicode_ci';

USE dbReLife;

DROP TABLE IF EXISTS siteCheck;

CREATE TABLE siteCheck (
    codiceEsito INT AUTO_INCREMENT PRIMARY KEY,
    esito ENUM('Positivo', 'Negativo', 'Da rivedere') DEFAULT 'Da rivedere' NOT NULL,
    data DATE NOT NULL,
    ora TIME NOT NULL,
    codiceDipendente INT,
    codiceUtente VARCHAR(20),
    FOREIGN KEY (codiceDipendente) REFERENCES siteEmployee(codice),
    FOREIGN KEY (codiceUtente) REFERENCES siteUser(username)
);

DROP PROCEDURE IF EXISTS addCheck;
DELIMITER //
CREATE PROCEDURE addCheck (
    param_esito ENUM('Positivo', 'Negativo', 'Da rivedere'),
    param_data DATE,
    param_ora TIME,
    param_codiceDipendente INT,
    param_codiceUtente VARCHAR(20)
)

DETERMINISTIC
BEGIN
    INSERT INTO siteCheck(esito, data, ora, codiceDipendente, codiceUtente)
    VALUES(param_esito, param_data, param_ora, param_codiceDipendente, param_codiceUtente) ;
END //
DELIMITER ;