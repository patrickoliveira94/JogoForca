def salvar_ranking(nome, pontos)
    conteudo = "#{nome}\n#{pontos}"
    File.write "rank.txt", conteudo
end

def ler_rank
	conteudo = File.read "rank.txt"
	conteudo.split "\n"
end