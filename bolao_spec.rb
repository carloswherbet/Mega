# 40 numeros que mais saem
require 'pry'
numeros_escolhidos = [5, 51, 4, 53, 33, 24, 42, 54, 23, 17, 49, 10, 29, 52, 50, 13, 28, 36, 44, 16, 43, 27, 2, 32, 41, 47, 30, 31, 12, 7, 8, 37, 56, 38, 1, 34, 58, 18, 59, 35]
matriz = []
7.times{matriz << []}
#GERAR MATRIZ DE 7 JOGOS COMBINANDO NUMEROS SELECIONADOS ALEATORIAMENTE
for i in 0..6
	for j in 0..5
		numero = numeros_escolhidos[rand(0..39)]
		while matriz[i].include? numero
			numero = numeros_escolhidos[rand(0..39)]
		end
		matriz[i][j] = numero
	end
end
#OUTPUT
matriz.each do |row|
	row = row.sort
	row.each_with_index do |v,k|
		row[k] = format('%02d', v)
	end
	p row
end