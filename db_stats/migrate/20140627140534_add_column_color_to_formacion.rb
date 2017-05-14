class AddColumnColorToFormacion < ActiveRecord::Migration
  def change
    add_column :formacions, :color, :string, :default => "background-color: rgb(255,255,216)"
  end
end
