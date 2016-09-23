class SourcesController < ApplicationController
  before_action :set_source, only: [:show]

  def index
    @is_noticed = cookies[:noticed] ? true : false
    cookies[:noticed] = true
    @sources = Source.all
  end

  def show
    @events = @source.events.where("ends_at >= ?", DateTime.now).order('starts_at asc').limit(50)
  end

  private

  def set_source
    @source = Source.find(params[:id])
  end
end