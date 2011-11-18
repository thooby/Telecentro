class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.decimal :precio

      t.timestamps
    end
  end
end
