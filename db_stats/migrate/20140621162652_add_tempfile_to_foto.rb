class AddTempfileToFoto < ActiveRecord::Migration
  def change
    add_column :fotos, :tempfile, :string
  end
end
