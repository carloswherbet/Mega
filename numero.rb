#encoding: utf-8
require 'csv'
require 'pry'	
probabilidades = {}
# números de 1 a 60
for n in 1..60 do 
	probabilidades[n] = 0
end
# soma-se as ocorrencias dos numeros no arquivo
CSV.foreach('numeros_ordenados.csv',:col_sep => ';', encoding: "UTF-8") do |row|
  linha = []
  row.each do |numero|
      linha << numero.to_i
  end

  linha.each do |numero|
    probabilidades[numero] = probabilidades[numero].to_i + 1
  end

end

#ordena pelos de maior ocorrencia
mais_coisados =  []
probabilidades.sort_by{|k, v| -v}.first(20).each do |mega|	
	puts "Número: #{mega[0]} - saiu #{mega[1]} vezes - #{(mega[1].to_f/1721)*100.round(2)}"    
    mais_coisados << mega[0]
end
qtd_acertos_por_sorteio = {}
count = 0
p "Os #{mais_coisados.size} Mais Sorteados"
mais_coisados.each do |x|
    print "#{x} " 
end
print "\n"

CSV.foreach('numeros_ordenados.csv',:col_sep => ';', encoding: "UTF-8") do |row|
    count  =  count + 1
    qtd_acertos_por_sorteio[count] = {}
    qtd_acertos_por_sorteio[count][:numeros]  = []
    qtd_acertos_por_sorteio[count][:acertos] =  0
binding.pry if qtd_acertos_por_sorteio[count][:numeros].nil?
    count_da_vez = 0

    linha = []
    row.each do |numero|
      linha << numero.to_i
    end
    linha.each do |numero|
      if mais_coisados.include? numero
        count_da_vez = count_da_vez + 1
        qtd_acertos_por_sorteio[count][:numeros] << numero
        qtd_acertos_por_sorteio[count][:acertos] = count_da_vez
      end
    end
end
#ordena pela maior quantidade de acertos
qtd_acertos_por_sorteio.sort_by{|k,v| -v[:acertos]}.first(10).each do |jogo|    
    p "Jogo: #{jogo[0]} - Numeros: #{jogo.last[:numeros].join(',')} - Acertos: #{jogo.last[:acertos]}"
end