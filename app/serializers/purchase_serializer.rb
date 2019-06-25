class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :minutes_remaining, :created_at

  has_one :user
  has_one :purchase_option

  def minutes_remaining
    remaining = (2 * 24 * 60) - ((Time.now - object.created_at) * 24 * 60).to_i
    if remaining.positive?
      remaining
    else
      0
    end
  end

end
