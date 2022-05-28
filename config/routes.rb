Rails.application.routes.draw do
  get 'recipes/index'
  root to: "resources#index"
  resources 'resources', only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
