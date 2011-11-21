class AddColumnPersona < ActiveRecord::Migration
  def change
    add_column :personas, :email, :string 
    add_column :personas, :celular, :string 
  end

end

