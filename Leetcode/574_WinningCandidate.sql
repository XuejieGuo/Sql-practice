SELECT Name
FROM Candidate
INNER JOIN
    (SELECT CandidateId
     FROM Vote
     GROUP BY CandidateId
     ORDER BY COUNT(*) DESC
     LIMIT 1) AS winner
WHERE Candidate.id = winner.CandidateId
