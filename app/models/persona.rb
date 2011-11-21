class Persona < ActiveRecord::Base
  has_many :venta
  belongs_to :tele_operador
  before_save do |persona|
    persona.name ="#{persona.nombre} #{persona.apellido1} #{persona.apellido2}"
  end
end
