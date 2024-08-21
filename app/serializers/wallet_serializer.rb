class WalletSerializer < ActiveModel::Serializer
  attributes :id,
             :amount
end
