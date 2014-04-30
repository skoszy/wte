class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index
    # intro text
    #  @results = Section.search(params[:search])
  end

  def show
    @page = Page.where(:permalink => params[:permalink], :visible => true).first
    if @page.nil?
      redirect_to(:action => 'index')

    else
      # display the page content using show.html.erb
    end
  end

  def sres
    if params[:search].empty?
      @results = nil
      flash.now[:danger] = "Please enter the name of a food."
      render 'index'
#      redirect_to(:action => 'index')
    else
      @results = Section.search(params[:search]) 
    end
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end

end
