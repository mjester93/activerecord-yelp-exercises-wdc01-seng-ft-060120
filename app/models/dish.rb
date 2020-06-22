class Dish < ActiveRecord::Base
    belongs_to :restaurant
    has_many :dish_tags
    has_many :tags, through: :dish_tags
    
    def self.names
        return Dish.all.map {|dish| dish.name}
    end

    def self.max_tags
        return Dish.all.max_by {|dish| dish.tags.length}
    end

    def self.untagged
        return Dish.all.select {|dish| dish.tags.length == 0}
    end

    def self.average_tag_count
        tag_counts = Dish.all.map {|dish| dish.tags.length}
        return tag_counts.sum / tag_counts.length.to_f
    end

    def tag_count
        return self.tags.length
    end

    def tag_names
        return self.tags.map {|tag| tag.name}
    end
end