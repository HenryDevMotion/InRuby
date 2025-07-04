# Praticando apenas. Trata-se basicamente de um grenciador revezamento de tarefas domésticas

pessoas = ["Ana", "Diana", "Igor"]
tarefas = ["Lavar louça", "Limpar a casa", "Tirar o lixo"]

escala_anterior = {
    "Ana" => "Lavar louça",
    "Diana" => "Tirar o lixo",
    "Igor" => "Limpar a casa"
}

def gerar_escala(pessoas, tarefas, escala_anterior)
    tarefas.permutation.to_a.each do |nova_distribuicao|
        escala_nova = {}

        conflito = false

        pessoas.each_with_index do |pessoa, i|
            tarefa_nova = nova_distribuicao[i]
            tarefa_antiga = escala_anterior[pessoa]

            if tarefa_nova == tarefa_antiga
                conflito = true
                break
            else
                escala_nova[pessoa] = tarefa_nova
            end
        end

        return escala_nova unless conflito
    end

    return nil
end

nova_escala = gerar_escala(pessoas, tarefas, escala_anterior)

puts "Escala da semana anterior:"
escala_anterior.each { |pessoa, tarefa| puts "#{pessoa}: #{tarefa}" }

puts "\nNova escala da semana:"
if nova_escala
    nova_escala.each { |pessoa, tarefa| puts "#{pessoa}: #{tarefa}" }
else
    puts "Não foi possível gerar uma nova escala sem repetições"
end