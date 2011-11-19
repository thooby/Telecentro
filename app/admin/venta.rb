ActiveAdmin.register Ventum do
  index do
      column :persona
      column :servicio
      column :cantidad
      column :monto
      column :fecha
      default_actions
    end
  
end
