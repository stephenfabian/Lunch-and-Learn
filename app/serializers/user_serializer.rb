class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :api_key
end
