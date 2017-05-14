class AddColumnCoordenadasToEvents < ActiveRecord::Migration
  def change
    add_column :events, :coordenadas, :string
  end
end
