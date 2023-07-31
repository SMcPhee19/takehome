class TeaSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :brew_temp, :brew_time
end