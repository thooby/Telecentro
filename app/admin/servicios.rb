ActiveAdmin.register Servicio do
  
  controller do |c|    
    def action_methods      
      ['index', 'edit', 'update']    
    end  
  end 

  index do
      column :nombre
      column :precio
    end
end
