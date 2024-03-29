Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { registrations: 'registrations' },
                     path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    resource :gist, only: :create
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: :index
    resources :badges, only: %i[new create edit update destroy show]
  end

  resources :badges, only: :index
end
