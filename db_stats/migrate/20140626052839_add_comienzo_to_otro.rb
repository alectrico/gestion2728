class AddComienzoToOtro < ActiveRecord::Migration
  def change
    add_column :otros, :comienzo, :date
    add_column :otros, :final, :date
    add_column :otros, :lugar, :string
  end
end
