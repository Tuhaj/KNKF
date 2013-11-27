class MeetingsController < ApplicationController
#czy only jest dobre?
  before_filter :authenticate_user! , only: [:new, :show, :edit, :update, :my, :add_me, :remove_me]
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  before_action :find_meeting, only: [:add_me,:remove_me]



  def index
    @only_mine = params[:my]
    if @only_mine
      @meetings = current_user.meetings
    else
      @meetings = Meeting.where("date>=?", Date.today)
    end
  end

  def show
   @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def create
    puts params
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to @meeting
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  def add_me      
    @meeting.users << current_user
    redirect_to @meeting
  end
  def remove_me
    @meeting.users.destroy(current_user)
    redirect_to my_meetings_path
  end

  private

   def set_meeting
      @meeting = Meeting.find(params[:id])
    end
   
   def find_meeting
      @meeting = Meeting.find(params[:meeting_id])
   end 


  
  def meeting_params
    params.require(:meeting).permit(:name, :description, :date, :users)
  end
end
