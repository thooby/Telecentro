ActiveAdmin.register Ventum do
  filter :persona
  filter :servicio
  filter :monto
  filter :fecha
  index do
      column("Fecha") {|ventum| ventum.fecha.to_formatted_s(:rfc822)}
      column("Hora") {|ventum| ventum.hora.strftime("%H:%M")}
      column :persona
      column :servicio
      column :cantidad
      default_actions
    end
    show do
      panel "Datos del pago" do
        attributes_table_for ventum do
          row("Nombre") {ventum.persona.name}
          row("Fecha") {ventum.fecha.to_formatted_s(:rfc822)}
          row("Hora") {ventum.hora.strftime("%H:%M")}       
          row :servicio
          row :cantidad
          row :monto
        end
      end
    end
  csv do
    column("Persona") {|ventum| ventum.persona.name}
    column("Servicio") {|ventum| ventum.servicio.nombre}
    column :cantidad
    column :monto
    column :fecha
    column("Hora") {|ventum| ventum.hora.strftime("%H:%M")}
    end
    form do |f|
          f.inputs "Datos del Servicio" do
            f.input :fecha, :default => Date.today
            f.input :hora
            f.input :persona          
            f.input :servicio
            f.input :cantidad

          end
          f.buttons
        end
end
