class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  enum :role, { "executive": 0, "admin": 1, "user": 2 }, default: :user
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
end