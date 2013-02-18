class District < ActiveRecord::Base
  attr_accessible :name, :province

  belongs_to :province

end
