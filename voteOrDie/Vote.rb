class Vote < ActiveRecord::Base

  def to_s
      "Vote number #{self.id} with a name of #{self.name} and is a #{self.pparty}"
    end

  end
