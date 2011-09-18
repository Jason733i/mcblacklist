class Server < ActiveRecord::Base
  IP_ADDRESS_FORMAT = /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})?$/
  belongs_to :user

  validates_numericality_of :port, :greater_than => 0
  validates_format_of :ip_address, :with => IP_ADDRESS_FORMAT, :message => "Ip address must be in the format XXX.XXX.XXX.XXX"
end
