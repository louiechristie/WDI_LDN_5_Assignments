class Galaxy < ActiveRecord::Base
  attr_accessible :name, :shape, :stars

validates :stars, numericality: {greater_than: 2}
validates :name, presence: true
validates :shape, inclusion: {in: ['spiral', 'globular', 'spheroid','oblate']}


end
