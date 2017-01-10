class ReviewersController < ApplicationController
  before_action :current_user_must_be_reviewer_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_reviewer_user
    reviewer = Reviewer.find(params[:id])

    unless current_user == reviewer.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Reviewer.ransack(params[:q])
    @reviewers = @q.result(:distinct => true).includes(:user, :reviews).page(params[:page]).per(10)

    render("reviewers/index.html.erb")
  end

  def show
    @review = Review.new
    @reviewer = Reviewer.find(params[:id])

    render("reviewers/show.html.erb")
  end

  def new
    @reviewer = Reviewer.new

    render("reviewers/new.html.erb")
  end

  def create
    @reviewer = Reviewer.new

    @reviewer.user_id = params[:user_id]
    @reviewer.name = params[:name]
    @reviewer.reviews_count = params[:reviews_count]
    @reviewer.average_rating = params[:average_rating]

    save_status = @reviewer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviewers/new", "/create_reviewer"
        redirect_to("/reviewers")
      else
        redirect_back(:fallback_location => "/", :notice => "Reviewer created successfully.")
      end
    else
      render("reviewers/new.html.erb")
    end
  end

  def edit
    @reviewer = Reviewer.find(params[:id])

    render("reviewers/edit.html.erb")
  end

  def update
    @reviewer = Reviewer.find(params[:id])
    @reviewer.name = params[:name]
    @reviewer.reviews_count = params[:reviews_count]
    @reviewer.average_rating = params[:average_rating]

    save_status = @reviewer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviewers/#{@reviewer.id}/edit", "/update_reviewer"
        redirect_to("/reviewers/#{@reviewer.id}", :notice => "Reviewer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reviewer updated successfully.")
      end
    else
      render("reviewers/edit.html.erb")
    end
  end

  def destroy
    @reviewer = Reviewer.find(params[:id])

    @reviewer.destroy

    if URI(request.referer).path == "/reviewers/#{@reviewer.id}"
      redirect_to("/", :notice => "Reviewer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reviewer deleted.")
    end
  end
end
