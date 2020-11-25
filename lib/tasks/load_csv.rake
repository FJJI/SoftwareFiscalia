require 'csv'

namespace :cargar_csv do
  desc "Importar csv"
  task marcas: :environment do
    filename = "datos.csv"
    direct = "app/assets/Marcas/" + filename
    counter = 0
    CSV.foreach(direct, "r", col_sep: ";") do |row|
      code, title = row
      crime_tag = CrimeTag.create(tag_id: code, tag: title)
      puts crime_tag.errors.full_messages if crime_tag.errors.any?
      counter += 1 if crime_tag.persisted?
    end
    puts "Se importaron #{counter} marcas"
  end

  task regiones_comunas: :environment do
    filename = "regiones_comunas.csv"
    direct = "app/assets/RegionesYComunas/" + filename
    counter_regiones = 0
    counter_comuna = 0

    CSV.foreach(direct, "r", col_sep: ",") do |row|
      reg = row[0]
      coms = []
      row.each_with_index do |val, idx|
        if idx>0
          coms.append(val)
        end
      end
      region = Region.create(region: reg)
      puts region.errors.full_messages if region.errors.any?
      counter_regiones += 1 if region.persisted?
      coms.each do |com|
        comuna = Comuna.create(comuna: com, region: region)
        puts comuna.errors.full_messages if comuna.errors.any?
        counter_comuna += 1 if comuna.persisted?
      end
    end
    puts "Se importaron #{counter_regiones} regiones y #{counter_comuna} comunas"
  end
end
