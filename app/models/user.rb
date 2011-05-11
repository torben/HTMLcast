class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  validates_presence_of [:firstname, :surname], :on => :create

  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :surname

  has_many :posts
  has_many :comments
  has_many :pages

  def name
    "#{firstname} #{surname}"
  end
end
