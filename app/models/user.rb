class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :avatar, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :physicians, dependent: :destroy


  enum role: { unregistered: 0, staff: 1, administrator: 2 }
  enum gender: { prefer_not_to_answer: 0, female: 1, male: 2 }

  def self.ransackable_attributes(auth_object = nil)
    [ "lastname", "firstname", "email", "gender", "role"]
  end

end
