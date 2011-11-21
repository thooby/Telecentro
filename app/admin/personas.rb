ActiveAdmin.register Persona do
  filter :name, :as => :string, :label => "Nombre y/o Apellidos"
  #filter :name
  filter :celular
  filter :email
  filter :tele_operador
  index do
      column :nombre
      column :apellido1
      column :apellido2
      column :celular
      column :tele_operador
      column :email
      default_actions
    end
    show :title => :name do
      panel "Datos personales" do
        attributes_table_for persona do
          row("Nombre") { persona.nombre }
          row("Primer apellido") { persona.apellido1 }
          row("Segundo apellido") { persona.apellido2 }
          row("Celular") { persona.celular }
          row("Tele Operador"){persona.tele_operador}
          row("e-mail") { persona.email }
        end
      end
    end
    form do |f|
          f.inputs "Identificación" do
            f.input :nombre
            f.input :apellido1
            f.input :apellido2
          end
          f.inputs "Opcional" do
            f.input :celular
            f.input :tele_operador
            f.input :email
          end
          f.buttons
        end
end
