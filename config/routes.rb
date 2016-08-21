Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "items#index"

  resource :items, only: [] do
    get ":type/:id" => :lookup
  end
end
