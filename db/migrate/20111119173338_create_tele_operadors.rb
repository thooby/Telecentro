class CreateTeleOperadors < ActiveRecord::Migration
  def change
    create_table :tele_operadors do |t|
      t.string :name

      t.timestamps
    end
  end
end
