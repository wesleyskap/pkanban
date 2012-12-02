class Sprint < ActiveRecord::Base
  belongs_to :User
  attr_accessible :date_end, :date_init, :name
end
