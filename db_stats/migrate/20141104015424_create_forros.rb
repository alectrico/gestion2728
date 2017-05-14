class CreateForros < ActiveRecord::Migration
  def change
    create_table( :forros, id:false)  do |t|
      t.string :id
      t.integer :aislacion_id
      t.integer :temperatura_servicio
      t.string :chaqueta_exterior
      t.boolean :es_unipolar
      t.boolean :es_multipolar
      t.boolean :ambiente_seco
      t.boolean :ambiente_humedo
      t.boolean :ambiente_mojado
      t.integer :grupo_canalizacion
      t.boolean :resiste_aceites
      t.boolean :resiste_grasas
      t.boolean :resiste_acidos
      t.boolean :resiste_gasolina
      t.boolean :emite_gases_toxicos
      t.boolean :emite_gases_corrosivos
      t.boolean :libre_de_halogenos
      t.boolean :uso_interior
      t.boolean :uso_exterior
      t.boolean :instalacciones_aereas
      t.boolean :instalaciones_subterraneas
      t.boolean :en_ducto
      t.boolean :sin_ducto
      t.boolean :en_tuberia
      t.boolean :en_bandeja
      t.boolean :en_escalerilla
      t.boolean :en_moldura
      t.boolean :en_acometida
      t.boolean :fuera_del_alcance
      t.boolean :sin_uv
      t.boolean :directamente_en_tierra
      t.boolean :tendido_subterraneo
      t.boolean :instalacion_sobrepuesta_sin_ducto
      t.boolean :para_alambre
      t.boolean :para_cable

      t.timestamps
    end
  end
end
