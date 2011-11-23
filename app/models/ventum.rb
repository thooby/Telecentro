class Ventum < ActiveRecord::Base
  belongs_to :servicio
  belongs_to :persona
  before_create :set_hora_to_now    
  before_create :set_fecha_to_now    
  before_save do |ventum|
    ventum.monto = ventum.cantidad*ventum.servicio.precio
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
  
end
