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

  has_many :posts, foreign_key: :author_id
end
