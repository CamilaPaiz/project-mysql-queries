SELECT 
    m.musica_nome AS cancao, COUNT(r.musica_id) AS reproducoes
FROM
    SpotifyClone.musica AS m
        INNER JOIN
    SpotifyClone.reproducao AS r ON m.musica_id = r.musica_id
GROUP BY m.musica_nome , r.musica_id
ORDER BY  (reproducoes) DESC , m.musica_nome
LIMIT 2;