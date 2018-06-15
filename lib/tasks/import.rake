require 'csv'

namespace :import do
  desc "Import UBSs from a downloaded csv"

  task ubs: :environment do
    puts "Start import"
    filename = File.join Rails.root, 'ubs.csv'

    size_translate = ['Desempenho ruim', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho acima da média', 'Desempenho muito acima da média']
    CSV.foreach(filename, headers: true) do |row|
      Ubs.find_or_initialize_by(latitude: row['vlr_latitude'], longitude: row['vlr_longitude']).update_attributes(name: row['nom_estab'], address: row['dsc_endereco'], city: row['dsc_cidade'], phone: row['dsc_telefone'], size: size_translate.index(row['dsc_estrut_fisic_ambiencia']), adaptation_for_seniors: size_translate.index(row['dsc_adap_defic_fisic_idosos']), medical_equipment: size_translate.index(row['dsc_equipamentos']), medicine: size_translate.index(row['dsc_medicamentos']))
    end
    puts "Imported #{Ubs.count} UBSs"
  end
end
