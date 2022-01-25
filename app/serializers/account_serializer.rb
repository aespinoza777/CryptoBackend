class AccountSerializer < ActiveModel::Serializer
  attributes :id, :coin_quantity, :price
  belongs_to :coin
  belongs_to :exchange

end
