class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_liked_post
        post = self.posts.max_by do |post|
            post.likes
        end
    end

    def average_age_of_bloggers
        ages = self.bloggers.uniq.map {|blogger| blogger.age}
        ages.reduce(:+) / ages.count
    end
end
