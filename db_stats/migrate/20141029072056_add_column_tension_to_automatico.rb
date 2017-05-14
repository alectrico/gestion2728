class AddColumnTensionToAutomatico < ActiveRecord::Migration
  def change
    add_column :automaticos, :tension, :integer
  end
end
