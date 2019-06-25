Rails.application.routes.draw do

  scope module: 'api' do
    scope '/api', as: 'api' do
      scope module: 'v1' do
        scope '/v1', as: 'v1' do

          resources :movies, only: [:index]

          resources :seasons, only: [:index]

          resources :titles, only: [:index]

          resources :purchases, only: [:create]

          resources :library, only: [:index]

        end
      end
    end
  end

end
