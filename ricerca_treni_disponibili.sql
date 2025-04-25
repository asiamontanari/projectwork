SELECT Treni.TrenoID, Treni.Tipo, Tratte.Durata, Tratte.Prezzo
FROM Treni
INNER JOIN Tratte ON Treni.TrenoID = Tratte.TrenoID
INNER JOIN Stazioni AS StazioniPartenza ON Tratte.StazionePartenza = StazioniPartenza.StazioneID
INNER JOIN Stazioni AS StazioniArrivo ON Tratte.StazioneArrivo = StazioniArrivo.StazioneID
WHERE StazioniPartenza.Nome = 'Milano Centrale'
AND StazioniArrivo.Nome = 'Bologna Centrale';



