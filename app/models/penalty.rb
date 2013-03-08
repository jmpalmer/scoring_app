class Penalty < ActiveRecord::Base
  attr_accessible :alliance_id, :foul, :match_id, :tech_foul
end
