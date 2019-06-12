class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # LOOK THESE UP TO UNDERSTAND
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
