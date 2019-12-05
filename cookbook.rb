require_relative 'receita.rb'

def bem_vindo()
  'Bem-vindo ao meu coockbook, sua rede social de recitas culinárias!'
end

def finalizar_uso()
  'Obrigado por usar o Cookbook'
end

def menu()
  puts ""
  puts "========================="
  puts '[1] Cadastrar uma receita'
  puts '[2] Ver todas as receitas'
  puts '[3] Buscar Receita'
  puts '[4] Sair'
  puts "========================="
  puts ""

  print 'Escolha uma opção: '
  gets.to_i
end

def inserir_receita
  print 'Digite o nome da receita: '
  nome = gets.chomp
  print 'Digite o tipo da receita: '
  tipo = gets.chomp

  system("clear")
  puts "receita de #{nome} do tipo #{tipo} inserida com sucesso"
  system("sleep 1.5")
  Receita.new(nome,tipo)
end

def imprimir_receitas(receitas)
  receitas.each_with_index do |receita, index|
    puts "##{index + 1} - #{receita}"
  end
  puts "Nenhuma receita cadastrada" if receitas.empty?

end

def pesquisar_receita(receitas)
  print 'Digite o termo a ser pesquisado: '
  entrada = gets.chomp
  puts "Procurando por... #{entrada}"
  puts "Resultado da pesquisa: \n\n"

  resultado_da_pesquisa =[]
  resultado_da_pesquisa = receitas.select {|item|item.nome.downcase.include?(entrada.downcase)}
  resultado_da_pesquisa += receitas.select {|item|item.tipo.downcase.include?(entrada.downcase)}
  resultado_da_pesquisa = resultado_da_pesquisa.uniq

  if !(entrada.empty?) && !(resultado_da_pesquisa.empty?)
    resultado_da_pesquisa.each {|element| puts element}
  else
    puts "0 receitas encontradas com esse termo..."
  end

  puts "\nfim da pesquisa \n"
end

def loop(opcao,receitas)

  while opcao != 4
    
    system("clear")

    if opcao == 1
      receitas << inserir_receita
    elsif opcao == 2
      imprimir_receitas(receitas)
    elsif opcao == 3
      pesquisar_receita(receitas)
    else
      puts 'Opção inválida'
    end

    opcao = menu()
  end

end




system('clear')

puts bem_vindo

opcao = menu()

receitas = []

loop(opcao,receitas)

puts finalizar_uso()

