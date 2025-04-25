SELECT Prenotazioni.PrenotazioneID, Biglietti.TrattaID, Biglietti.Data, Biglietti.Prezzo, Prenotazioni.Stato
FROM Prenotazioni
INNER JOIN Biglietti ON Biglietti.PrenotazioneID = Prenotazioni.PrenotazioneID
WHERE Prenotazioni.ClienteID = 4;
