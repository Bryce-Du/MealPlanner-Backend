class IngredientSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :calories
end