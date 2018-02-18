class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url, :zip
end
