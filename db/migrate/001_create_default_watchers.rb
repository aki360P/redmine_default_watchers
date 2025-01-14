class CreateDefaultWatchers < ActiveRecord::CompatibleLegacyMigration.migration_class
  #for redmine 3x, class xxx < ActiveRecord::Migration
  #for redmine 4x, class xxx < ActiveRecord::Migration[4.2]
  
  def self.up
    create_table :default_watchers do |t|
      t.column :user_id, :integer
      t.column :watcher_id, :integer
    end
  end

  def self.down
    drop_table :default_watchers
  end
end
