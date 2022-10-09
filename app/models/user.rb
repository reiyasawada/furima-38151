class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true, length: { maximum: 6 }
    validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

    validates :read_last, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :read_first, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birthday
  end
end
