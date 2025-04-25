SELECT Biglietti.BigliettoID, Biglietti.Data, Biglietti.Prezzo, Sconti.Tipo, 
    CONCAT(Sconti.Percentuale, '%') AS Percentuale
FROM Biglietti 
INNER JOIN Biglietti_Sconti ON Biglietti.BigliettoID = Biglietti_Sconti.BigliettoID
INNER JOIN Sconti ON Biglietti_Sconti.ScontoID = Sconti.ScontoID;

