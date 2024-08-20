module Stocks
  class BasicSerializer < ActiveModel::Serializer
    attributes :id,
               :username
  end
end
