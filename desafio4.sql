SELECT 
    DISTINCT(u.usuario_nome) AS usuario,
   
	CASE
    WHEN YEAR(MAX(r.data_reproducao)) >= '2021' THEN 'Usuário ativo'
    WHEN YEAR(MAX(r.data_reproducao)) < '2021' THEN 'Usuário inativo'
    END AS'status_usuario'
FROM
    SpotifyClone.usuario AS u
        INNER JOIN
    SpotifyClone.reproducao AS r ON u.usuario_id = r.usuario_id
GROUP BY u.usuario_nome 
ORDER BY usuario_nome;