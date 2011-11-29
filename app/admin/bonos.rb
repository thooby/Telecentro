ActiveAdmin.register Bono do
  controller do |c|    
    def action_methods      
      ['index', 'edit', 'update']    
    end  
  end
  index do
    column :persona
    column :remanente
  end
end
