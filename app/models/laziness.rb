class Laziness < ApplicationRecord
  def level
    return "novice" if activity_points <= 100
    return "fan" if activity_points < 200
    return "star" if activity_points <= 300
    return "expert" if activity_points <= 400
    return "champion" if activity_points <= 500
    return "boss" if activity_points <= 1000
  end
end
