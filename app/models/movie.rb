class Movie < ApplicationRecord
  has_many :rentals, as: :rentable
  enum status: ["billboard", "preorder", "coming-soon" ]

  def rented
    rentals.any?
  end
end
# == Schema Information
#
# Table name: movies
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  duration    :integer
#  price       :integer
#  rating      :integer
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
