class EventController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @all_events = Event.all
    @all_users = User.all
  end

  def show
    @current_event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
                   'title' => params[:title],
                   'description' => params[:description],
                   'start_date' => params[:start_date],
                   'price' => params[:price]
                   )              
    if @event.save
      redirect_to root_path(success: true)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
