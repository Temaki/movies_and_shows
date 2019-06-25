class Season < ApplicationRecord

  has_many :episodes, -> { order(number: :asc) }
  has_many :purchase_options, as: :purchaseable

end
