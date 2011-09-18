class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  has_many :servers

  before_create :set_default_role

  def admin?
    role == "Admin"
  end

  def member?
    role == "Member"
  end

  def set_default_role
    self.role = "Member"
  end
end