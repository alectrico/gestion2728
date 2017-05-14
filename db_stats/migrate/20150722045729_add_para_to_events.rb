class AddParaToEvents < ActiveRecord::Migration
  def change
    add_column :events, :para, :string
  end
end
