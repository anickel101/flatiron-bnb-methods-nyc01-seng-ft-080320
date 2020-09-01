class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations

  validates :address, :title, :description, :neighborhood_id, :price, :listing_type, presence: true

  before_create 


  def average_review_rating
    total_rating = self.reviews.sum {|review| review.rating}
    total_reviews = self.reviews.size
    total_rating.to_f/total_reviews
  end

end
