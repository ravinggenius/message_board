class Identity < ApplicationRecord
  devise *[
    # :confirmable,
    :database_authenticatable,
    # :lockable,
    # :omniauthable
    :recoverable,
    :registerable,
    :rememberable,
    # :timeoutable,
    :trackable,
    :validatable
  ]
end
