class Stat < ActiveRecord::Base

  def to_s
      "Stat number #{self.id} with a name of #{self.league} and is a #{self.team}"
    end

  end
