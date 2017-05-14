class AddColumnContextoToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :contexto, :string
  end
end
