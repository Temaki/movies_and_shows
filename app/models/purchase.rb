class Purchase < ApplicationRecord

  monetize :price_cents

  belongs_to :user
  belongs_to :purchase_option

  validate :not_already_purchased


  scope :active, -> {
    where('purchases.created_at >= ?', 2.days.ago)
  }

  scope :active_for_user, -> (user) {
    active.where(user: user)
  }

  private

  def not_already_purchased
    if user.purchases.active.joins(:purchase_option).where(purchase_options: { purchaseable: purchase_option.purchaseable }).count.zero?
      true
    else
      errors.add(:title, "is already in the user's library")
      false
    end
  end

end
