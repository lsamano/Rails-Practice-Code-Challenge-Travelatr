class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def most_likes
        post = self.posts.max_by do |post|
            post.likes
        end
    end

    	# - **BONUS** A list of that user's top 5 most written about destinations (the destinations with the most posts)
    def top_five_destinations
        # array_of_destinations = self.posts.map do |post|
        #     post.destination
        # end
        hash = self.destinations.each_with_object(Hash.new(0)) do |destination, hash|
            hash[destination.name] += 1
        end
        array = hash.sort_by {|k, v| -v}[0..4]
    end
end
