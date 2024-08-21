class Wallet < ApplicationRecord
  belongs_to :entity, polymorphic: true

  after_save :update_amount

  def update_amount
    update_column(:amount, calculate_amount)
  end

  def calculate_amount
    credits = Transactions::CreditTransaction.sum(:amount) || 0.0
    debits = Transactions::DebitTransaction.sum(:amount) || 0.0

    (credits - debits).to_f
  end
end
