class Tag < ActiveRecord::Base
    has_many :dish_tags
    has_many :dishes, through: :dish_tags

    def self.most_common
        Tag.all.max_by {|tag| tag.dishes.length}
    end

    def self.least_common
        Tag.all.min_by {|tag| tag.dishes.length}
    end

    def self.unused
        Tag.all.select {|tag| tag.dishes.length == 0}
    end

    def self.uncommon
        Tag.all.select {|tag| tag.dishes.length < 5}
    end

    def self.popular
        Tag.all.sort_by {|tag| tag.dishes.length}.reverse[0...5]
    end

    def restaurants
        all_dishes = Tag.all.map {|tag| tag.dishes}.flatten.uniq
        return all_dishes.map {|dish| dish.restaurant}.uniq
    end
end