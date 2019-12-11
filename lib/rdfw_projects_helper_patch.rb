require 'projects_helper'

module Rdfw
  module ProjectsHelperPatch
    extend ActiveSupport::Concern

    def project_settings_tabs
      tabs = super
      return tabs unless @project.module_enabled?(:redmine_default_watchers)

      tabs.tap { |t| t << append_rdfw_tab }.compact
    end

    def append_rdfw_tab
      @rdfw = DefaultWatcher.find_or_create(@project.id)
      action = { name: 'default_watchers',
                 controller: 'default_watchers',
                 action: :edit,
                 partial: 'default_watchers/show', label: :label_default_watchers }
      return nil unless User.current.allowed_to?(action, @project)

      action
    end
  end
end

ProjectsController.helper(Rdfw::ProjectsHelperPatch)
