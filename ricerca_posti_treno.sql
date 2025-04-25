SELECT Treni.TrenoID, 
       Treni.Capacità - IFNULL(COUNT(Biglietti.BigliettoID), 0) AS PostiDisponibili
FROM Treni
INNER JOIN Tratte ON Treni.TrenoID = Tratte.TrenoID
INNER JOIN Biglietti ON Tratte.TrattaID = Biglietti.TrattaID
LEFT JOIN Prenotazioni ON Biglietti.PrenotazioneID = Prenotazioni.PrenotazioneID
WHERE Tratte.TrattaID = 1
  AND Prenotazioni.Stato = 'Confermato'
GROUP BY Treni.TrenoID, Treni.Capacità;
