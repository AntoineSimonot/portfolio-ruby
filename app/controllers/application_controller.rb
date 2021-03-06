class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include DeviseSetsource
    include DeviseCurrentUser
    include DevisePageContent

    before_action :set_copyright

    def set_copyright
        @copyright = DevcampViewTool::Renderer.copyright 'Jordan Hudgens', 'All rights reserved'
    end
end

module DevcampViewTool
    class Renderer
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
end