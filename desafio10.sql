SELECT 
    m.musica_nome AS nome, COUNT(r.musica_id) AS reproducoes
FROM
    SpotifyClone.musica AS m
        INNER JOIN
    SpotifyClone.reproducao AS r ON m.musica_id = r.musica_id
        INNER JOIN
    SpotifyClone.usuario AS u ON u.usuario_id = r.usuario_id
WHERE
    u.plano_id IN (1 , 4)
GROUP BY m.musica_nome , r.musica_id
ORDER BY m.musica_nome; 
