def boas_vindas
	puts "/********************/"
	puts "/*  Jogo da Forca.  */"
	puts "/********************/"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n\n\n"
	puts "Vamos começar a jogar, #{nome}"
	return nome
end

def desenha_forca(erros)
	cabeca = "   "
	bracos = "   "
	pernas = "   "
	corpo = " "
	if erros >= 1
		cabeca = "(_)"
	end
	if erros >= 2
		bracos = " | "
		corpo = "| "
	end
	if erros >= 3
		bracos = "\\|/"
	end
	if erros >= 4
		pernas = "/ \\"
	end
	puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |      #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts
end

def avisa_escolhendo_palavra_secreta
	puts "Escolhendo uma palavra secreta..."
end

def avisa_palavra_escolhida(palavra_secreta)
	puts "Palavra secreta contém #{palavra_secreta.size} letras..."
	puts "Boa sorte!"
	return palavra_secreta
end

def jogar_novamente
	puts "Deseja jogar novamente? S - Sim, N - Não"
	jogar_novamente = gets.strip
	return jogar_novamente.upcase == "S"
end

def cabecalho_tentativas(chutes, erros, mascara)
	puts "\n\n\n"
	desenha_forca(erros)
	puts "Palavra secreta #{mascara}"
	puts "Erros até agora: #{erros}"
	puts "Será que acertou? Você chutou #{chutes}"
end	

def novo_chute
	puts "Entre com uma letra ou uma palavra:"
	chute = gets.strip
	puts "Será que acertou? Você chutou #{chute}"
	return chute.upcase
end

def avisa_chute(chute)
	puts "Você já chutou a letra #{chute}"
end

def avisa_letra_nao_encontrada
	puts "Letra não encontrada."
end

def avisa_letra_encontrada(total_encontrado)
	puts "Letra encontrada #{total_encontrado} vezes."
end

def avisa_acertou_palavra
	puts "\nParabéns, você ganhou!"
        puts

        puts "       ___________      "
        puts "      '._==_==_=_.'     "
        puts "      .-\\:      /-.    "
        puts "     | (|:.     |) |    "
        puts "      '-|:.     |-'     "
        puts "        \\::.    /      "
        puts "         '::. .'        "
        puts "           ) (          "
        puts "         _.' '._        "
        puts "        '-------'       "
        puts
    end

def avisa_errou_palavra
	puts "Que pena... errou!"
end

def avisa_pontos(pontos_ate_agora)
	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def avisa_pontos_totais(pontos_totais)
	puts "Você possui #{pontos_totais} pontos."
end

def avisa_campeao_atual(dados)
	puts "Nosso campeão atual é #{dados[0]} com #{dados[1]} pontos."
end

def palavra_secreta_era(palavra_secreta)
	puts "A palavra secreta era: #{palavra_secreta}"
end











