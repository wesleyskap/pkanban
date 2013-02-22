class Task < ActiveRecord::Base
  belongs_to :Sprint
  attr_accessible :Sprint_id, :color, :date_end, :date_init, :name, :obs, :priority, :column

  default_scope order('priority desc')
end
