class ItemSerializer
  include FastJsonapi::ObjectSerializer
  # belongs_to :merchant
  attributes :name, :unit_price, :description
end
