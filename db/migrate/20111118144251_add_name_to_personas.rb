class AddNameToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :name, :string 
  end
end
