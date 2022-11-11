class RecipeSerializer
  include JSONAPI::Serializer
  attributes :title, :url, :image

  
end
