class Ventum < ActiveRecord::Base
  belongs_to :servicio
  belongs_to :persona
  before_save do |ventum|
    ventum.monto = ventum.cantidad*ventum.servicio.precio
  end
  
end
