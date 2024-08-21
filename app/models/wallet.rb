class Wallet < ApplicationRecord
  belongs_to :entity, polymorphic: true

  after_save :update_amount

  has_many :transactions, dependent: :nullify
  has_many :credit_transactions, class_name: "Transactions::CreditTransaction"
  has_many :debit_transactions, class_name: "Transactions::DebitTransaction"

  def update_amount
    update_column(:amount, calculate_amount)
  end

  def calculate_amount
    credits = credit_transactions.sum(:amount) || 0.0
    debits = debit_transactions.sum(:amount) || 0.0

    (credits - debits).to_f
  end
end
