Rails.application.routes.draw do
  root to: redirect("/cats")

  resources :cats, only: [:create, :index, :show, :new, :edit, :update]
end
