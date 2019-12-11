require 'redmine'

require_dependency 'new_issue_hook_listener'
require_dependency 'rdfw_projects_helper_patch'
require_dependency 'rdfw_issues_controller_patch'

Redmine::Plugin.register :redmine_default_watchers do
  name 'Redmine Default Watchers plugin'
  author 'Masatomo Nakano, Robert Gravina, Akinori Iwasaki'
  description 'Redmine plugin allowing users to manage a default watchers list. These watchers are checked by default when creating a new issue.'
  version '0.2.0'
  
  project_module :redmine_default_watchers do
    permission :default_watchers, :default_watchers => [:edit]
  end
end
