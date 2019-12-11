class DefaultWatchersController < ApplicationController
  unloadable
  before_action :require_login
  before_action :find_user, :find_project, :authorize

  def initialize
    super()
  end

  def show
  end
  
  def edit

    unless params[:settings].nil?
      rdfw = DefaultWatcher.find_or_create(@project.id)
      rdfw.update(rdfw_params)

      temp = rdfw.watcher_ids.gsub!("\"","")
      rdfw.attributes = { watcher_ids: temp}
      rdfw.save


      flash[:notice] = l(:notice_successful_update)
      redirect_to controller: 'projects',
                  action: 'settings', id: @project, tab: 'default_watchers'
    end
    
  end
  

  
  

  private

  def find_user
    @user = User.current
  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
  
  def rdfw_params
    params.require(:settings).permit(watcher_ids: [])
  end
end
