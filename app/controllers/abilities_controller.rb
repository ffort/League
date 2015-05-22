class AbilitiesController < ApplicationController
  
  layout "admin"

  before_action :confirm_logged_in
  before_action :find_champion

  def index
    @abilities = @champion.abilities.sorted
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def new
    @ability = Ability.new({:champion_id => @champion.id})
    @champions = Champion.order('position ASC')
    @ability_count = Ability.count + 1
  end

  def create
    @ability = Ability.new(page_params)
    if @ability.save
      flash[:notice] = "Ability created Successfully!"
      redirect_to(:action => 'index', :champion_id => @champion.id)
    else
      @champions = Champion.order('position ASC')
      @ability_count = Ability.count + 1
      render('new')
    end
  end

  def edit
    @ability = Ability.find(params[:id])
    @champions = Champion.order('position ASC')
    @ability_count = Ability.count + 1
  end

  def delete
    @ability = Ability.find(params[:id])
  end

  def destroy
    ability = Ability.find(params[:id]).destroy
    flash[:notice] = "Ability destroyed successfully!"
    redirect_to(:action => 'index', :champion_id => @ability.id)
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update_attributes(page_params)
      flash[:notice] = "Ability updated successfully!"
      redirect_to(:action => 'show', :id => @ability.id, :champion_id => @champion.id)
    else
      @champions = Ability.order('position ASC')
      @ability_count = Ability.count
      render('edit')
    end
  end




  private

  def page_params
    params.require(:ability).permit(:name, :position)
  end

  def find_champion
    if params[:champion_id]
      @champion = Champion.find(params[:champion_id])
    end
  end


end
