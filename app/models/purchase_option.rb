class PurchaseOption < ApplicationRecord

  monetize :price_cents

  belongs_to :purchaseable, polymorphic: true
  has_many :purchases

  enum video_quality: {
    SD: 'SD',
    HD: 'HD',
  }


end
