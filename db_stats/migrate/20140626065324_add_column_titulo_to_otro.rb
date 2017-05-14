class AddColumnTituloToOtro < ActiveRecord::Migration
  def change
    add_column :otros, :titulo, :string
  end
end
