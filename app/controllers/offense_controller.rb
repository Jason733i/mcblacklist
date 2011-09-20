class OffenseController < ApplicationController
  include ApplicationHelper
  load_and_authorize_resource

  def index
    unless current_user
      redirect_to root_path
    end
    @offenses = Offense.accessible_by(current_ability)
    respond_to_resource @offenses
  end

  def show
    @offense = Offense.accessible_by(current_ability).find_by_id(params[:id])
    respond_to_resource @offense
  end

  def new
    @offense = @offense || Offense.new
  end

  def edit
    @offense = @offense || Offense.accessible_by(current_ability).find_by_id(params[:id])
  end

  def create
    begin
      @offense = Offense.new(params[:offense])
      @offense.save!
    rescue
      render :new
    else
      redirect_to offense_index_path
    end
  end

  def update
    begin
      @offense = Offense.accessible_by(current_ability).find(params[:id])
      @offense.update_attributes(params[:offense])
      @offense.save!
    rescue
      render :edit
    else
      redirect_to offense_index_path
    end
  end

  def destroy
    begin
      Offense.accessible_by(current_ability).find_by_id(params[:id]).delete
    rescue
      flash[:notice] = "You do not have permissions to delete that!"
    else
      redirect_to offense_index_path
    end
  end

end
