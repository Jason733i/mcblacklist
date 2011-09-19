class Server < ActiveRecord::Base
  IP_ADDRESS_FORMAT = /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})?$/
  belongs_to :user

  validates_presence_of :name, :ip_address
  validates_format_of :ip_address, :with => IP_ADDRESS_FORMAT, :message => "format is incorrect, try (192.168.0.1)"
  validates_numericality_of :port, :greater_than => 0
end
