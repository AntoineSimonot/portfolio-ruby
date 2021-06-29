class PortfoliosController < ApplicationController
    before_action :set_portfolio, except: %i[ index new create ]
    layout "portfolio"
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

    def index
      @portfolio_items = Portfolio.by_position
      flash[:notice] = "YOUR MESSAGE"  
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def show
        
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)

        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: "Your portfolio was successfully created." }
            format.json { render :show, status: :created, location: @portfolios }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @portfolios.errors, status: :unprocessable_entity }
          end
        end
      end

    def edit
      
    end

    def update
        respond_to do |format|
          if @portfolio_item.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: "Your portfolio was successfully created." }
            format.json { render :show, status: :created, location: @portfolios }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @portfolios.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @portfolio_item.destroy
        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: "Porfolio item was successfully destroyed." }
            format.json { head :no_content }
        end
    end


    private 
    def set_portfolio
      @portfolio_item = Portfolio.friendly.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image, :main_image, technologies_attributes: [:name, :id, :_destroy])
    end
end
