class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index
    @champions = Champion.sorted

  end

  def show
    @page = Page.where(:permalink => params[:permalink], :visible => true).first

    if @page.nil? and @champion.nil?
      redirect_to(:action => 'index')
    else
      #display page
    end
  end

  def champion
    @champion = Champion.where(:permalink => params[:permalink]).first

    if @champion.nil?
      redirect_to(:action => 'index')
    else
      #displah page
    end
  end

  def showChampion
    @champion = Champion.find(params[:id])
    # @champion = Champion.where(:permalink => params[:permalink]).first
  end

  def championIndex
    @champions = Champion.sorted
  end

  private

    def setup_navigation
      @subjects = Subject.visible.sorted
    end
end
