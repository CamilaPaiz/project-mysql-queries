SELECT 
    COUNT(musica_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.reproducao
        WHERE usuario_id = 1;