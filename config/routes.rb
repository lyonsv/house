Rails.application.routes.draw do
  resource :dashboard, only: [:index]
  resource :line_items
  resource :groceries
  root to: "dashboard#index"
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

end
