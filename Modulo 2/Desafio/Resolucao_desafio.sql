use dadosJogadores;

    SELECT ps.nome_pais, avg(num_vitorias)
	FROM jogador as jg
    join pais as ps
    on ps.cod_pais = jg.cod_pais
	GROUP BY ps.nome_pais
    order by avg(num_vitorias) desc;
    
    select ps.nome_pais, sum(num_derrotas) as derrotas, nome_jogo
    from jogador as jg
    join pais as ps
    on ps.cod_pais = jg.cod_pais
    join jogo as jo
    on jo.cod_jogo = jg.cod_jogo
    where nome_jogo = 'Jogo da velha'
	group by ps.nome_pais, nome_jogo
    order by derrotas desc;
    
	select sum(total_partidas) as maior_partida, nome_jogo
    from jogador as jg
    join jogo as jo
    on jo.cod_jogo = jg.cod_jogo
    group by nome_jogo
    order by maior_partida desc;

	select sum(total_partidas) as maior_partida, nome_jogo, genero
    from jogador as jg
    join jogo as jo
    on jo.cod_jogo = jg.cod_jogo
    where jg.genero = 'feminino'
    group by nome_jogo, genero
    order by maior_partida desc;
    
	select nome_pais, count(nome_jogador) as maior_jogador, nome_jogo
    from jogador as jg
    join pais as ps
    on ps.cod_pais = jg.cod_pais
    join jogo as jo
    on jo.cod_jogo = jg.cod_jogo
    where nome_jogo = 'dama'
    group by nome_pais, nome_jogo
    order by maior_jogador desc;
    
    