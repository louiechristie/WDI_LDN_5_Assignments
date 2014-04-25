class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :feeds_people, :name, :ingridient_id, :ingridient_ids

  belongs_to :category
  has_and_belongs_to_many :ingridients

  validates :name, presence: true;
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
  validates :description, presence: true;
  validates :description, length: {minimum: 2}
end
