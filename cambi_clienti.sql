SELECT Clienti.Nome, Stazioni.Nome AS StazioneCambio, Cambi.OrdineCambio, Tratte_Stazioni.OrarioArrivo, Tratte_Stazioni.OrarioPartenza
FROM Cambi
JOIN Clienti ON Cambi.ClienteID = Clienti.ClienteID
JOIN Stazioni ON Cambi.StazioneID = Stazioni.StazioneID
LEFT JOIN Tratte_Stazioni ON Cambi.StazioneID = Tratte_Stazioni.StazioneID
ORDER BY Cambi.ClienteID, Cambi.OrdineCambio;


