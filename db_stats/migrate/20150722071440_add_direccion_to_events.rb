class AddDireccionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :direccion, :string
  end
end
