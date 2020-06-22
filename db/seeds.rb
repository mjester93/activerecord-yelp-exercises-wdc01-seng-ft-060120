tag_array = ["Spicy", "Vegitarian", "Vegan", "Raw", "Cheap", "Low Carb", "Gluten Free", "Dessert", 
"Mexican", "American", "Asian", "Italian", "Expensive", "Seafood", "Fruit"]

20.times do |x|
    Restaurant.create(name: Faker::Restaurant.unique.name)
end

50.times do |x|
    Dish.create(name: Faker::Food.unique.dish, restaurant: Restaurant.all.sample)
end

tag_array.each do |tag|
    Tag.create(name: tag)
end

Dish.all.each do |dish|
    tags = Tag.all.shuffle
    3.times do |x|
        DishTag.create(dish: dish, tag: tags.pop)
    end
end