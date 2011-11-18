ActiveAdmin.register Ventum do
  index do
      column :persona
      column :servicio
      column :fecha
      column :monto
      default_actions
    end
  
end
