SELECT DISTINCT
    u.usuario_nome AS usuario,
    COUNT(r.usuario_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(m.duracao) / 60, 2) AS total_minutos
FROM
    SpotifyClone.usuario AS u
        INNER JOIN
    SpotifyClone.reproducao AS r ON r.usuario_id = u.usuario_id
        INNER JOIN
    SpotifyClone.musica AS m ON m.musica_id = r.musica_id
GROUP BY usuario_nome , r.usuario_id
ORDER BY u.usuario_nome;