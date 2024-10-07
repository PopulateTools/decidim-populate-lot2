require "sidekiq/web"

Rails.application.routes.draw do
  mount Decidim::Core::Engine => '/'
  mount Decidim::Stats::Engine, at: "/stats", as: "decidim_stats"
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
