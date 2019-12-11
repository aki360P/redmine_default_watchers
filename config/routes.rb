Rails.application.routes.draw do
  match 'projects/:project_id/settings/default_watchers/:action', :controller => 'default_watchers', :via => [:get, :post, :patch, :put]
end