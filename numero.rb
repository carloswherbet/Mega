#encoding: utf-8
require 'csv'
require 'pry'	
probabilidades = {}
for n in 1..60 do 
	probabilidades[n] = 0
end

CSV.foreach('Numeros.csv',:col_sep => ';', encoding: "UTF-8") do |row|
  
	num_1 = row[0].to_i
	num_2 = row[1].to_i
	num_3 = row[2].to_i
	num_4 = row[3].to_i
	num_5 = row[4].to_i
	num_6 = row[5].to_i
  
  
	probabilidades[num_1] = probabilidades[num_1].to_i + 1
	probabilidades[num_2] = probabilidades[num_2].to_i + 1
	probabilidades[num_3] = probabilidades[num_3].to_i + 1
	probabilidades[num_4] = probabilidades[num_4].to_i + 1
	probabilidades[num_5] = probabilidades[num_5].to_i + 1
	probabilidades[num_6] = probabilidades[num_6].to_i + 1      	
  
end
mais_coisados =  []
probabilidades.sort_by{|k, v| -v}.first(6).each do |mega|	
	puts "Número: #{mega[0]} - saiu #{mega[1]} vezes - #{(mega[1].to_f/1720)*100.round(2)}"    
    mais_coisados << mega[0]
end
qtd_acertos_por_sorteio = {}
count = 0
p "Mais Sorteados"
mais_coisados.each do |x|
    p "#{x}" 
end
CSV.foreach('Numeros.csv',:col_sep => ';', encoding: "UTF-8") do |row|

    count  =  count + 1
    qtd_acertos_por_sorteio[count] =   {}
    qtd_acertos_por_sorteio[count][:numeros]  = []
    qtd_acertos_por_sorteio[count][:acertos] =  0
binding.pry if qtd_acertos_por_sorteio[count][:numeros].nil?
    count_da_vez = 0
    num_1 = row[0].to_i
    num_2 = row[1].to_i
    num_3 = row[2].to_i
    num_4 = row[3].to_i
    num_5 = row[4].to_i
    num_6 = row[5].to_i
    

    if mais_coisados.include? num_1
        count_da_vez = count_da_vez + 1
        qtd_acertos_por_sorteio[count][:acertos] =   count_da_vez

        qtd_acertos_por_sorteio[count][:numeros] << num_1
    end
    if mais_coisados.include? num_2
        count_da_vez = count_da_vez + 1        
        qtd_acertos_por_sorteio[count][:acertos] =   count_da_vez
        qtd_acertos_por_sorteio[count][:numeros] << num_2
        
    end
    if mais_coisados.include? num_3
        count_da_vez = count_da_vez + 1
        qtd_acertos_por_sorteio[count][:acertos] =   count_da_vez
        qtd_acertos_por_sorteio[count][:numeros] << num_3
        
    end
    if mais_coisados.include? num_4
        count_da_vez = count_da_vez + 1
        qtd_acertos_por_sorteio[count][:acertos] =   count_da_vez
        qtd_acertos_por_sorteio[count][:numeros] << num_4
        
    end
    if mais_coisados.include? num_5
        count_da_vez = count_da_vez + 1
        qtd_acertos_por_sorteio[count][:acertos] =   count_da_vez
        qtd_acertos_por_sorteio[count][:numeros] << num_5

    end

    if mais_coisados.include? num_6
        count_da_vez = count_da_vez + 1
        qtd_acertos_por_sorteio[count][:acertos] =   count_da_vez
        qtd_acertos_por_sorteio[count][:numeros] << num_6

    end
    
    
end

qtd_acertos_por_sorteio.sort_by{|k,v| -v[:acertos]}.first(6).each do |jogo|    
    p "Jogo: #{jogo[0]} - Numeros: #{jogo.last[:numeros].join(',')} - Acertos: #{jogo.last[:acertos]}"
end


