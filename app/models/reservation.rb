class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review

  validates :checkin, :checkout, presence: true


  def duration
    duration = self.checkout - self.checkin
    duration.to_i
  end

  def total_price
    self.duration * self.listing.price
  end

end
