class Category < ActiveRecord::Base
    enum value: [:repartir_viveres, :remover_escombros, :asistencia_medica, :transportar_viveres,
                 :asesoria_legal, :asistencia_mascotas, :asesoria_grietas, :asesoria_psicologica, 
                 :etiquetar_viveres, :revelo_volntarios, :asistencia_sonido, :transporte_general]
end
