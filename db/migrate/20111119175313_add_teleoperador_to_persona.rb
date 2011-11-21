class AddTeleoperadorToPersona < ActiveRecord::Migration
  def change
    add_column :personas, :tele_operador_id, :integer
  end
end
