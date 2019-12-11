class CreateTable < ActiveRecord::CompatibleLegacyMigration.migration_class
  #for redmine 3x, class xxx < ActiveRecord::Migration
  #for redmine 4x, class xxx < ActiveRecord::Migration[4.2]
  
  def self.up
    #drop old table
    drop_table :default_watchers
    
    #create new
    create_table :default_watchers do |t|
      t.column :project_id, :integer
      t.column :watcher_ids, :text
    end
  end

  def self.down
    drop_table :default_watchers
  end
end
