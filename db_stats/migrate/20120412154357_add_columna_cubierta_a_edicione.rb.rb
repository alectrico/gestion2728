class AddColumnaCubiertaAEdicione < ActiveRecord::Migration
  def change
    add_column :ediciones, :cubierta, :string, :default => ''
  end
end
