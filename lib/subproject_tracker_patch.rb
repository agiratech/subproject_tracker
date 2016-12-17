require_dependency 'project'

module SubprojectTrackerPatch
  def self.included(base) # :nodoc:

    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      has_and_belongs_to_many :subprojects_trackers, :class_name => 'Tracker', :join_table => :subprojects_trackers
      safe_attributes  'subprojects_tracker_ids'
    end
  end

  module InstanceMethods
    # Returns the current cost of the TimeEntry based on it's rate and hours
    def subproject_tracker_enabled(tracker)
      subprojects_trackers.include? tracker
    end

    def parent_with_subproject
      Project.where("(projects.id = #{id} OR (projects.lft > #{lft} AND projects.rgt < #{rgt}))")
    end
  end
end

Project.send(:include, SubprojectTrackerPatch)