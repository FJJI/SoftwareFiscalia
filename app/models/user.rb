class User < ApplicationRecord
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :rut, format: { with: /\d{1,2}\.\d{3}\.\d{3}[\-][0-9kK]{1}/,
                            message: 'invalid' }, uniqueness: true

  def Carabinero?
    if job == "Carabinero"
      true
    else
      false
    end
  end

  def Fiscal?
    if job == "Fiscal"
      true
    else
      false
    end
  end

  def Admin?
    if job == "Admin"
      true
    else
      false
    end
  end
end
