class ChangeToDateTimePagos < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :pagos do |t|
        dir.up  {t.change :payment_date, :datetime}
        dir.down{t.change :payment_date, :date}
      end
    end
  end
end
