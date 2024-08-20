module Transactions
  class DebitTransaction < Transaction
    def self.sti_name
      "debit"
    end
  end
end
