class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = self.user
     if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
       notice = notices[0]
     elsif self.user.tickets < self.attraction.tickets
       notice = notices[1]
     elsif self.user.height < self.attraction.min_height
       notice = notices[2]
     else
       take_tickets
       adjust_nausea
       adjust_happiness
       @user.save
       notice = notices[3]
     end
  end

  def take_tickets
    @user.tickets -= self.attraction.tickets
  end

  def adjust_nausea
    @user.nausea += self.attraction.nausea_rating
  end

  def adjust_happiness
    @user.happiness += self.attraction.happiness_rating
  end

  def notices
    ["Sorry. You do not have enough tickets to ride the #{attraction_name}. You are not tall enough to ride the #{attraction_name}.","Sorry. You do not have enough tickets to ride the #{attraction_name}.","Sorry. You are not tall enough to ride the #{attraction_name}.","Thanks for riding the #{attraction_name}!"]
  end

  def attraction_name
    self.attraction.name
  end

end
