class Ventum < ActiveRecord::Base
  belongs_to :servicio
  belongs_to :persona
end
