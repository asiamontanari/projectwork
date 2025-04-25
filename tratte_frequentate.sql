SELECT Tratte.TrattaID,
    CONCAT(Partenza.Nome, ' - ', Arrivo.Nome) AS NomeTratta,
    COUNT(Prenotazioni.PrenotazioneID) AS NumeroPrenotazioni
FROM Tratte
INNER JOIN Biglietti ON Tratte.TrattaID = Biglietti.TrattaID
INNER JOIN Prenotazioni ON Biglietti.PrenotazioneID = Prenotazioni.PrenotazioneID
INNER JOIN Stazioni AS Partenza ON Tratte.StazionePartenza = Partenza.StazioneID
INNER JOIN Stazioni AS Arrivo ON Tratte.StazioneArrivo = Arrivo.StazioneID
WHERE Prenotazioni.Stato = 'Confermato'
GROUP BY Tratte.TrattaID, Partenza.Nome, Arrivo.Nome
ORDER BY NumeroPrenotazioni DESC
LIMIT 5;






