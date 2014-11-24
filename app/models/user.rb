class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :conversations, :foreign_key => :sender_id
  
  before_create :set_name
  
  def set_name
    email = self.email.split('@')
    self.name = email[0]
  end

end
