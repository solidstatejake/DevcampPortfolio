module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] unless params[:q].nil?
  end
end


def set_source
  session[:source] = params[:q] unless params[:q].nil?
end