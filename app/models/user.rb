class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :employee_number, uniqueness: { case_sensitive: false }, format: { with: /\A[0-9]{10}\z/ }
    validates :last_name, format: { with: /\A[a-zぁ-んァ-ヶ一-龥々ー]+\z/i }
    validates :first_name, format: { with: /\A[a-zぁ-んァ-ヶ一-龥々ー]+\z/i }
  end
end
