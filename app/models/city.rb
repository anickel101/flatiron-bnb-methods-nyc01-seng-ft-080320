class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, through: :neighborhoods
  has_many :reservations, through: :listings

  def city_openings(start_date, end_date)
    byebug
    self.reservations.select {|res| res.checkin >= start_date && res.checkout}

  end

  def self.highest_ratio_res
  end

  def self.most_res
  end

end

#RESERVATIONS
#<ActiveRecord::Associations::CollectionProxy [
  #<Reservation id: 1, checkin: "2014-04-25", checkout: "2014-04-30", listing_id: 1, guest_id: 4, created_at: "2020-09-01 01:37:02", updated_at: "2020-09-01 01:37:02", status: "accepted">, 
  
  #<Reservation id: 2, checkin: "2014-03-10", checkout: "2014-03-25", listing_id: 2, guest_id: 5, created_at: "2020-09-01 01:37:02", updated_at: "2020-09-01 01:37:02", status: "accepted">, 
  
  #<Reservation id: 4, checkin: "2014-05-02", checkout: "2014-05-08", listing_id: 1, guest_id: 5, created_at: "2020-09-01 01:37:02", updated_at: "2020-09-01 01:37:02", status: "accepted">, 
  
  #<Reservation id: 5, checkin: "2014-05-10", checkout: "2014-05-15", listing_id: 1, guest_id: 4, created_at: "2020-09-01 01:37:02", updated_at: "2020-09-01 01:37:02", status: "accepted">]>


#START DATE
#"2014-05-01"

#END DATE
#"2014-05-05"


#<Listing id: 2, address: "6 Maple Street", listing_type: "shared room", title: "Shared room in apart...eighborhood_id: 1, host_id: 2, created_at: "2020-09-01 01:34:54", updated_at: "2020-09-01 01:34:54"> 
#<Listing id: 3, address: "44 Ridge Lane", listing_type: "whole house", title: "Beautiful Home on Mou...eighborhood_id: 3, host_id: 3, created_at: "2020-09-01 01:34:54", updated_at: "2020-09-01 01:34:54">

#LISTINGS
#<ActiveRecord::Associations::CollectionProxy [
  #<Listing id: 1, address: "123 Main Street", listing_type: "private room", title: "Beautiful Apartment on Main Street", description: "My apartment is great. there's a bedroom. close to...", price: 0.5e2, neighborhood_id: 1, host_id: 1, created_at: "2020-09-01 01:37:02", updated_at: "2020-09-01 01:37:02">, 
  
  #<Listing id: 2, address: "6 Maple Street", listing_type: "shared room", title: "Shared room in apartment", description: "shared a room with me because I'm poor", price: 0.15e2, neighborhood_id: 1, host_id: 2, created_at: "2020-09-01 01:37:02", updated_at: "2020-09-01 01:37:02">, 
  
  #<Listing id: 3, address: "44 Ridge Lane", listing_type: "whole house", title: "Beautiful Home on Mountain", description: "Whole house for rent on mountain. Many bedrooms.", price: 0.2e3, neighborhood_id: 3, host_id: 3, created_at: "2020-09-01 01:37:02", updated_at: "2020-09-01 01:37:02">]>

