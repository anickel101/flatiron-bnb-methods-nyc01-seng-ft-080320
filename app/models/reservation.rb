class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, class_name: "User"
  has_one :review

  validates :checkin, :checkout, presence: true
  validate :correct_timeline


  def duration
    duration = self.checkout - self.checkin
    duration.to_i
  end

  def total_price
    self.duration * self.listing.price
  end

  private

  def correct_timeline
    if self.checkout && self.checkin && self.checkin >= self.checkout
      errors.add(:guest_id, "Checkout date is sooner than the Checkin date. What's up?")
    end
  end



end
