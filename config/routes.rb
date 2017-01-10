Rails.application.routes.draw do
  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------

  devise_for :customers
  # Routes for the Customer resource:
  # READ
  get "/customers", :controller => "customers", :action => "index"
  get "/customers/:id", :controller => "customers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
