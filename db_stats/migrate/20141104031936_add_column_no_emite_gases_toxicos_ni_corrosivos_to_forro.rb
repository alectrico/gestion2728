class AddColumnNoEmiteGasesToxicosNiCorrosivosToForro < ActiveRecord::Migration
  def change
    add_column :forros, :no_emite_gases_toxicos_ni_corrosivos, :boolean
  end
end
