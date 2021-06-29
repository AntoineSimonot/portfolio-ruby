class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
    extend FriendlyId
    # include Placeholder
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body


  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  
    def self.myGreatService
        where(subtitle: "my great service")
    end

    def self.by_position
        order("position ASC")
    end

    

    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "my great service") }

    # after_initialize :set_defaults

    # def set_defaults
    #     self.main_image ||=  Placeholder.image_generator("600", "300")
    #     self.thumb_image ||= Placeholder.image_generator("300", "200")
    # end
end
