class CreateBonos < ActiveRecord::Migration
  def change
    create_table :bonos do |t|
      t.integer :persona_id
      t.datetime :hora_entrada
      t.datetime :hora_salida
      t.decimal :remanente
      t.timestamps
    end
  end
end
