class Sprint < ActiveRecord::Base
  belongs_to :User
  attr_accessible :date_end, :date_init, :name

  validates_presence_of :User_id, :name
  validates_numericality_of :User_id
end
