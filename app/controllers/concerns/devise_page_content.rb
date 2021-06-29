module DevisePageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_content
    end

    def set_content
        @page_title = "Devcamp Portfolio"
        @seo_keywords = "Portfolio Antoine Dev"
    end
end