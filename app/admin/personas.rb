ActiveAdmin.register Persona do
  index do
      column :nombre
      column :apellido1
      column :apellido2
      default_actions
    end
end
