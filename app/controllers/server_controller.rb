class ServerController < ApplicationController
  include ApplicationHelper
  def index
    unless current_user
      redirect_to root_path
    end
    @servers = Server.find_all_by_user_id(current_user.id)
    respond_to_resource @servers
  end

  def show
    @server = Server.find_by_id(params[:id])
    respond_to_resource @server
  end

  def new
    @server = @server || Server.new
  end

  def edit
    @server = @server || Server.find_by_id(params[:id])
  end

  def create
    begin
      @server = Server.new(params[:server])
      @server.user = current_user
      @server.save!
    rescue
      render :new
    else
      redirect_to server_index_path
    end
  end

  def update
    begin
      @server = Server.find(params[:id])
      @server.update_attributes(params[:server])
      @server.save!
    rescue
      render :edit
    else
      redirect_to server_index_path
    end
  end

  def destroy
    begin
      Server.find_by_id(params[:id]).delete
    rescue
      flash[:notice] = "You do not have permissions to delete that!"
    else
      redirect_to server_index_path
    end
  end



end
