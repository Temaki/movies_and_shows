class PurchaseOptionSerializer < ActiveModel::Serializer
  attributes :id, :video_quality, :price

  has_one :purchaseable

end
