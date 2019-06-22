# frozen_string_literal: true

class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[edit update show destroy]
  layout 'portfolio'
  access all: [:show, :index],
         user: { except: [:destroy, :new, :create, :update, :edit, :toggle_status, :show]},
         site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true #make so rails doesn't try to find a 'sort' view
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html do
          redirect_to portfolios_path,
                      notice: 'Your portfolio item is now live.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html do
          redirect_to portfolios_path,
                      notice: "#{@portfolio_item.title} was successfully updated."
        end
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url,
                                notice: "#{@portfolio_item.title} was deleted" }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy]
    )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
