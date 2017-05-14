class AddColumnNuncaAbiertoToExamenes < ActiveRecord::Migration
  def change
    add_column :examenes, :nunca_abierto, :boolean
  end
end
