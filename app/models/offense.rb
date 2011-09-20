class Offense < ActiveRecord::Base
  CLASSIFICATIONS = "Destructive", "Constructive", "Harassment", "Hacking"

  validates_presence_of :name, :description, :classification
  validates_numericality_of :severity, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9

  def self.classifications
    CLASSIFICATIONS
  end

end
