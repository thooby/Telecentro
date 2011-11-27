class Ventum < ActiveRecord::Base
  belongs_to :servicio
  belongs_to :persona
  before_create :set_hora_to_now    
  before_create :set_fecha_to_now    
  before_save do |ventum|
      if (ventum.servicio.nombre == 'Impresión') or (ventum.servicio.nombre == 'Escaneo')
         ventum.monto = ventum.cantidad*ventum.servicio.precio
      elsif (ventum.servicio.nombre == 'Internet') and  (ventum.persona.bono)
        ventum.monto = 0.0
        ventum.persona.bono.remanente -= ventum.cantidad.to_f
        if ventum.persona.bono.remanente < 0.0
          ventum.monto = -ventum.persona.bono.remanente * ventum.servicio.precio
          ventum.persona.bono.remanente = 0.0
        end
      elsif (not ventum.persona.bono)
        ventum.monto = ventum.cantidad*ventum.servicio.precio
        if self.servicio.nombre == 'Bono Internet' 
          ventum.persona.bono = Bono.new(:persona_id => ventum.persona.id,:remanente => 6.0*ventum.cantidad) 
        end
      elsif  ventum.persona.bono 
        ventum.monto = ventum.cantidad*ventum.servicio.precio
        ventum.persona.bono.remanente = ventum.persona.bono.remanente + ventum.cantidad*6.0  
      else
    end 
    if ventum.persona.bono
      ventum.persona.bono.save
    end

  end
  
  def set_hora_to_now
    self.hora = Time.now
  end
  def set_fecha_to_now
    self.fecha = Date.today
  end
  def self.this_month
    where('fecha >= ?', Date.new(Time.now.year, Time.now.month, 1).to_date)
  end
  def self.this_day
    where('fecha >= ?', Date.new(Time.now.year, Time.now.month, Time.now.day).to_date)
  end
  def self.this_yesterday
    where('fecha = ?', Date.new(Time.now.year, Time.now.month, Time.now.day-1).to_date)
  end
end
