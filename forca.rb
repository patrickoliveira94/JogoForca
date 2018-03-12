require_relative 'ui'
require_relative 'rank'

def escolher_palavra_secreta
	avisa_escolhendo_palavra_secreta
	texto = File.read("dicionario.txt")
	todas_as_palavras = texto.split "\n"
	numero_escolhido = rand(todas_as_palavras.size)
	palavra_secreta = todas_as_palavras[numero_escolhido]
	avisa_palavra_escolhida(palavra_secreta)
	return palavra_secreta.upcase
end

def palavra_mascarada(chutes, palavra_secreta)
	mascara = ""
	for letra in palavra_secreta.chars
		if chutes.include? letra
			mascara << letra
		else
			mascara << "_"
		end
	end
	return mascara
end

def chute_valido(chutes, erros, mascara)
	cabecalho_tentativas(chutes,erros, mascara)
	loop do
		chute = novo_chute
		if chutes.include? chute
			avisa_chute(chute)
		else
			return chute
		end
	end
end

def jogar(nome)
	palavra_secreta = escolher_palavra_secreta

	erros = 0
	chutes = []
	pontos_ate_agora = 0

	while erros < 5
		mascara = palavra_mascarada(chutes, palavra_secreta)
		chute = chute_valido(chutes, erros, mascara)
		chutes << chute

		chutou_letra = chute.size == 1
		if chutou_letra
			letra_procurada = chute[0]
			total_encontrado = palavra_secreta.count(letra_procurada)

			if total_encontrado == 0
				avisa_letra_nao_encontrada
				erros += 1
			else
				avisa_letra_encontrada(total_encontrado)
			end

			if mascara.count('_') == total_encontrado
    			avisa_acertou_palavra
    			palavra_secreta_era (palavra_secreta) 
    			break
			end

		else
			acertou = chute == palavra_secreta
			if acertou
				avisa_acertou_palavra
				palavra_secreta_era (palavra_secreta)
				pontos_ate_agora += 100
				break
			else
				avisa_errou_palavra
				pontos_ate_agora -= 30
				erros += 1
			end
		end
	end

	palavra_secreta_era (palavra_secreta)
	avisa_pontos(pontos_ate_agora)
	pontos_ate_agora
end

def jogo_da_forca
	nome = boas_vindas
	pontos_totais = 0

	avisa_campeao_atual(ler_rank)

	loop do
		pontos_totais += jogar(nome)
		avisa_pontos_totais(pontos_totais)

		if ler_rank[1].to_i < pontos_totais
			salvar_ranking(nome, pontos_totais)
		end

		if !jogar_novamente
			break
		end
	end
end