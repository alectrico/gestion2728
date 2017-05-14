class AddColumnCostolizableToCosto < ActiveRecord::Migration
  def change
    change_table :costos do |t|
      t.references :costolizable, polymorphic:true
    end
  end
end
