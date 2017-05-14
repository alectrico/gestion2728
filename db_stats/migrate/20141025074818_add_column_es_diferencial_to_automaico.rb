class AddColumnEsDiferencialToAutomaico < ActiveRecord::Migration
  def change
    add_column :automaticos, :es_diferencial, :boolean
  end
end
