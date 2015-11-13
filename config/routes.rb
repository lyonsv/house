Rails.application.routes.draw do
  get 'groceries_list/edit'

  resource :dashboard, only: [:index]
  resource :line_items
  resource :groceries
  resources :grocery_list
  root to: "dashboard#index"
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

end
