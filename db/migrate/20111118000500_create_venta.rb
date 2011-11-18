class CreateVenta < ActiveRecord::Migration
  def change
    create_table :venta do |t|
      t.integer :persona_id
      t.integer :servicio_id
      t.decimal :cantidad
      t.decimal :monto
      t.date :fecha
      t.time :hora

      t.timestamps
    end
  end
end
