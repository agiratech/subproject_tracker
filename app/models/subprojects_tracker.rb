class SubprojectsTracker < ActiveRecord::Base
  unloadable
  belongs_to :tracker
end
