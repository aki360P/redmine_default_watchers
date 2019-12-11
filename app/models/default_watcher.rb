class DefaultWatcher < ActiveRecord::Base
  include Redmine::SafeAttributes
  

  def self.find_or_create(project_id)
    rdfw = DefaultWatcher.where(['project_id = ?', project_id]).first
    puts ' ====================== '
    
    unless rdfw.present?
      rdfw = DefaultWatcher.new()
      rdfw.attributes = { project_id: project_id }
      
      rdfw.attributes = { watcher_ids: "0" }
            
      rdfw.save!
    end
    rdfw
  end
end
