SELECT 
    a.artista_nome AS artista,
    b.album_nome AS album,
    COUNT(s.artista_id) AS seguidores
FROM
    SpotifyClone.artista AS a
        INNER JOIN
    SpotifyClone.album AS b ON b.artista_id = a.artista_id
        INNER JOIN
    SpotifyClone.seguindo AS s ON s.artista_id = a.artista_id
GROUP BY b.album_nome , a.artista_nome , s.artista_id
ORDER BY seguidores DESC , artista , album;