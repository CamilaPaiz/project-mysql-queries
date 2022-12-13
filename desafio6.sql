SELECT 
    ROUND(MIN(p.preco), 2) AS 'faturamento_minimo',
    ROUND(MAX(p.preco), 2) AS 'faturamento_maximo',
    ROUND(AVG(p.preco), 2) AS 'faturamento_medio',
   ROUND(SUM( p.preco),2) AS 'faturamento_total'
FROM
    SpotifyClone.plano AS p
        INNER JOIN
    SpotifyClone.usuario AS u ON u.plano_id = p.plano_id;
