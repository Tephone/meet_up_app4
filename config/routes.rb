Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :students, controllers: {sessions: 'students/sessions', registrations: 'students/registrations'}
  devise_for :teachers
  root 'tops#show'
  resource :top, only: [:show]
  namespace :admins do
    resources :teachers, only: %i[index new create destroy]
  end
  resource :admin, only: [:show]
  resource :student, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
