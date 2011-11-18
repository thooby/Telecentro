class Servicio < ActiveRecord::Base
  has_many :venta
  alias_attribute :name, :nombre
end
