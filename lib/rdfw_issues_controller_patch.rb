require_dependency 'issues_controller'

module Rdfw
	module IssuesControllerPatch
	  def self.included(base)
		base.send(:include, InstanceMethods)
  
		base.class_eval do
		  unloadable # Send unloadable so it will not be unloaded in development
		  before_action :add_watchers, :only => [:new]
		end
	  end
  
	  module InstanceMethods
		def add_watchers
			@rdfw = DefaultWatcher.find_or_create(@project.id)
			puts "-----" 
			puts @rdfw.watcher_ids
		end
	  end
	end
  end
  
  IssuesController.send(:include, Rdfw::IssuesControllerPatch) unless IssuesController.included_modules.include? Rdfw::IssuesControllerPatch
  
