CREATE DATABASE new_GestioneFerroviaria;

USE new_GestioneFerroviaria;

CREATE TABLE Stazioni (
    StazioneID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Località VARCHAR(100)
);

CREATE TABLE Treni (
    TrenoID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(50),
    Capacità INT,
    Servizi TEXT
);

CREATE TABLE Tratte (
    TrattaID INT PRIMARY KEY AUTO_INCREMENT,
    Durata TIME,
    Prezzo DECIMAL(8,2),
    TrenoID INT,
    StazionePartenza INT,
    StazioneArrivo INT,
    FOREIGN KEY (TrenoID) REFERENCES Treni(TrenoID),
    FOREIGN KEY (StazionePartenza) REFERENCES Stazioni(StazioneID),
    FOREIGN KEY (StazioneArrivo) REFERENCES Stazioni(StazioneID)
);

CREATE TABLE Clienti (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Prenotazioni (
    PrenotazioneID INT PRIMARY KEY AUTO_INCREMENT,
    Stato VARCHAR(20),
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clienti(ClienteID)
);

CREATE TABLE Biglietti (
    BigliettoID INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE,
    Prezzo DECIMAL(8,2),
    Classe VARCHAR(20),
    TrattaID INT,
    PrenotazioneID INT,
    FOREIGN KEY (TrattaID) REFERENCES Tratte(TrattaID),
    FOREIGN KEY (PrenotazioneID) REFERENCES Prenotazioni(PrenotazioneID)
);

CREATE TABLE Sconti (
    ScontoID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(50),
    Percentuale DECIMAL(5,2)
);

CREATE TABLE Cambi (
    CambioID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    StazioneID INT,
    OrdineCambio INT,
    FOREIGN KEY (ClienteID) REFERENCES Clienti(ClienteID),
    FOREIGN KEY (StazioneID) REFERENCES Stazioni(StazioneID)
);

CREATE TABLE Biglietti_Sconti (
    BigliettoID INT,
    ScontoID INT,
    PRIMARY KEY (BigliettoID, ScontoID),
    FOREIGN KEY (BigliettoID) REFERENCES Biglietti(BigliettoID),
    FOREIGN KEY (ScontoID) REFERENCES Sconti(ScontoID)
);

CREATE TABLE Tratte_Stazioni (
    TrattaID INT,
    StazioneID INT,
    PRIMARY KEY (TrattaID, StazioneID),
    FOREIGN KEY (TrattaID) REFERENCES Tratte(TrattaID),
    FOREIGN KEY (StazioneID) REFERENCES Stazioni(StazioneID)
);

ALTER TABLE Tratte_Stazioni
ADD COLUMN OrarioArrivo TIME AFTER StazioneID,
ADD COLUMN OrarioPartenza TIME AFTER OrarioArrivo;


-- VINCOLI DI INTEGRITA'
ALTER TABLE Sconti
ADD CHECK (Percentuale BETWEEN 0 AND 100);

ALTER TABLE Treni
ADD CHECK (Capacità > 0);

ALTER TABLE Biglietti
ADD CHECK (Prezzo >= 0);

ALTER TABLE Clienti
ADD CHECK (CHAR_LENGTH(Email) <= 100 AND Email LIKE '%@%');

ALTER TABLE Cambi
ADD CHECK (OrdineCambio > 0);



-- INDICI
CREATE INDEX idx_stazione_partenza ON Tratte(StazionePartenza);
CREATE INDEX idx_stazione_arrivo ON Tratte(StazioneArrivo);
CREATE INDEX idx_prenotazioni_cliente ON Prenotazioni(ClienteID);
CREATE INDEX idx_biglietti_data ON Biglietti(Data);
CREATE UNIQUE INDEX idx_email_telefono ON Clienti(Email, Telefono);


