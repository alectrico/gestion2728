class AddFotolizableIdToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :fotolizable_id, :integer
    add_column :fotos, :fotolizable_type, :string
  end
end
