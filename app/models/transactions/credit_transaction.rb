module Transactions
  class CreditTransaction < Transaction
    def self.sti_name
      "credit"
    end
  end
end
