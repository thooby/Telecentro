ActiveAdmin.register Persona do
  filter :name, :as => :string, :label => "Nombre y/o Apellidos"
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
          row("email") {persona.email}
          row("celular") {persona.celular}
          row("operador") {persona.tele_operador.name}
        end
      end
      panel "Resumen de consumo" do
        table_for(persona.venta) do
          column("Fecha", :sortable => :fecha) {|ventum| link_to "#{ventum.fecha}", admin_ventum_path(ventum) }
          column("Servicio") {|ventum| ventum.servicio.nombre}
          column("Cantidad") {|ventum| ventum.cantidad.to_s}
          column("Monto") {|ventum| ventum.monto.to_s}
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
