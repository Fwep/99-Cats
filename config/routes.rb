Rails.application.routes.draw do
  root to: redirect("/cats")

  resources :cats, only: [:create, :index, :show, :new, :edit, :update]
  resources :cat_rental_requests, only: [:new, :create] do
    member do 
      post 'approve'
      post 'deny'
    end
  end
end
