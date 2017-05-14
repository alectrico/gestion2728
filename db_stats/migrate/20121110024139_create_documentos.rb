class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.string :titulo

      t.timestamps
    end
  end
end
