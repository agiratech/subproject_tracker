class CreateSubprojectsTrackers < ActiveRecord::Migration
  def self.up
    create_table :subprojects_trackers do |t|
      t.column :project_id, :integer, :default => 0, :null => false
      t.column :tracker_id, :integer, :default => 0, :null => false
    end
    add_index :subprojects_trackers, :project_id, :name => :projects_trackers_project_id
    add_index :subprojects_trackers, [:project_id, :tracker_id], :name => :projects_trackers_unique
  end

  def self.down
    drop_table :subprojects_trackers
  end
end
