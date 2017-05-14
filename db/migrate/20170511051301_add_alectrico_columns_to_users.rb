class AddAlectricoColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_column :users, :auth_token, :string
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime
    add_column :users, :member, :boolean
    add_column :users, :client, :boolean
    add_column :users, :alumno, :boolean
    add_column :users, :profesor, :boolean
    add_column :users, :presupuesto_id, :integer
    add_column :users, :direccion, :string
    add_column :users, :sintoma, :string
    add_column :users, :image_uid, :string
    add_column :users, :image_name, :string
    add_column :users, :email_malo, :boolean
    add_column :users, :instalador, :boolean
    add_column :users, :rut, :integer
    add_column :users, :rut_string, :string
    add_column :users, :pago_id, :integer
    add_column :users, :paye, :boolean
    add_column :users, :google_url, :string
    add_column :users, :visitante, :boolean
    add_column :users, :estado, :string
    add_column :users, :type , :string
  end
end
