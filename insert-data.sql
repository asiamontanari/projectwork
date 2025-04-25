INSERT INTO Treni (Tipo, Capacità, Servizi) 
VALUES 
('Regionale', 200, 'Wi-Fi'),
('Alta Velocità', 300, 'Wi-Fi, Ristorante'),
('Intercity', 400, 'Wi-Fi, Bagagli'),
('Intercity Notturno', 550, 'Cuccette, Ristorante');


INSERT INTO Stazioni (Nome, Località) 
VALUES 
('Milano Centrale', 'Milano'),
('Roma Termini', 'Roma'),
('Firenze SMN', 'Firenze'),
('Napoli Centrale', 'Napoli'),
('Bologna Centrale', 'Bologna'),
('Venezia S.L.', 'Venezia'),
('Torino Porta Nuova', 'Torino');


INSERT INTO Tratte (StazionePartenza, StazioneArrivo, Durata, Prezzo, TrenoID)
VALUES 
(1, 2, '03:30:00', 90.00, 1),
(2, 3, '01:30:00', 30.00, 2),
(3, 4, '02:15:00', 50.00, 3),
(1, 5, '01:10:00', 35.00, 4),
(5, 6, '03:00:00', 50.00, 1),
(6, 7, '04:30:00', 85.00, 3);


INSERT INTO Clienti (Nome, Email, Telefono) 
VALUES 
('Mario Rossi', 'mario.rossi@email.com', '3455678231'),
('Anna Bianchi', 'anna.bianchi@email.com', '3471234678'),
('Luca Verdi', 'luca.verdi@email.com', '3336545677'),
('Giulia Neri', 'giulia.neri@email.com', '3487612345'),
('Marco Blu', 'marco.blu@email.com', '3209078564'),
('Serena Rosa', 'serena.rosa@email.com', '3298456112');


INSERT INTO Prenotazioni (ClienteID, Stato)
VALUES 
(1, 'Confermato'),
(2, 'Annullato'),
(3, 'Confermato'),
(4, 'In attesa'),
(5, 'Annullato'),
(6, 'Confermato');



INSERT INTO Biglietti (TrattaID, Data, Prezzo, Classe, PrenotazioneID)
VALUES 
(1, '2025-03-15', 89.00, 'Prima', 1),
(2, '2025-03-16', 39.00, 'Terza', 2),
(3, '2025-03-17', 55.00, 'Prima', 3),
(4, '2025-03-18', 40.00, 'Seconda', 4),
(5, '2025-03-19', 65.00, 'Seconda', 5),
(6, '2025-03-20', 25.00, 'Terza', 6);


INSERT INTO Sconti (Tipo, Percentuale)
VALUES 
('Studente', 20),
('Anziani', 30),
('Promo', 10),
('Famiglia', 15),
('Lavoratori', 25);


INSERT INTO Cambi (ClienteID, StazioneID, OrdineCambio)
VALUES 
(1, 5, 1),  -- Mario Rossi cambia a Bologna Centrale
(1, 6, 2),  -- Mario Rossi cambia a Venezia S.L.
(3, 3, 1),  -- Luca Verdi cambia a Firenze
(4, 2, 1);  -- Giulia Neri cambia a Roma Termini


INSERT INTO Biglietti_Sconti (BigliettoID, ScontoID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO Tratte_Stazioni (TrattaID, StazioneID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 5),
(6, 6);


UPDATE Tratte_Stazioni 
SET OrarioArrivo = NULL, OrarioPartenza = '08:00:00' 
WHERE TrattaID = 1 AND StazioneID = 1;

UPDATE Tratte_Stazioni 
SET OrarioArrivo = '09:30:00', OrarioPartenza = '09:45:00' 
WHERE TrattaID = 2 AND StazioneID = 2;

UPDATE Tratte_Stazioni 
SET OrarioArrivo = '10:45:00', OrarioPartenza = '11:00:00' 
WHERE TrattaID = 3 AND StazioneID = 3;

UPDATE Tratte_Stazioni 
SET OrarioArrivo = '11:30:00', OrarioPartenza = NULL 
WHERE TrattaID = 4 AND StazioneID = 1;

UPDATE Tratte_Stazioni 
SET OrarioArrivo = '13:00:00', OrarioPartenza = '13:20:00' 
WHERE TrattaID = 5 AND StazioneID = 5;

UPDATE Tratte_Stazioni 
SET OrarioArrivo = '19:00:00', OrarioPartenza = '19:25:00' 
WHERE TrattaID = 6 AND StazioneID = 6;





