SELECT 
    artista_nome AS artista, b.album_nome AS album
FROM
    SpotifyClone.artista AS a
        INNER JOIN
    SpotifyClone.album AS b ON b.artista_id = a.artista_id
    HAVING a.artista_nome ='Elis Regina';