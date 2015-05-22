class ChampionController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
     @champions = Champion.sorted
  end

  def show
    @champion = Champion.find(params[:id])
  end

  def new
    @champion = Champion.new
    @champion_count = Champion.count + 1
  end

  def create
    @champion = Champion.new(champion_params)
    if @champion.save
      flash[:notice] = "Champion Added successfully!"
      redirect_to(:action =>'index')
    else
      @champion_count = Champion.count + 1
      render('new')
    end
  end

  def edit
    @champion = Champion.find(params[:id])
    @champion_count = Champion.count
  end

  def update
    @champion = Champion.find(params[:id])
    if @champion.update_attributes(champion_params)
      flash[:notice] = "Champion updated succesfully!"
      redirect_to(:action => 'show', :id => @champion.id)
    else
      @champion_count = Champion.count
      render('edit')
    end
  end

  def delete
    @champion = Champion.find(params[:id])
  end

  def destroy
    champion = Champion.find(params[:id]).destroy
    flash[:notice] = "Champion '#{champion.name}' destroyed successfully!"
    redirect_to(:action => 'index')
  end

  private

  def champion_params
    params.require(:champion).permit(:champion_name, :primary_role, :secondary_role, :damage_type, :permalink)
  end


end
