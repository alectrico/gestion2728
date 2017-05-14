class AddColumnMaterializableToMaterial < ActiveRecord::Migration
  def change
      change_table :materiales do |t|
        t.references :materializable, polymorphic:true
      end
  end
end
