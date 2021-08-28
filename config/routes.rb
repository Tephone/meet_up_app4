Rails.application.routes.draw do
  get 'teachers/show'
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :students, controllers: {sessions: 'students/sessions', registrations: 'students/registrations'}
  devise_for :teachers, controllers: {sessions: 'teachers/sessions', registrations: 'teachers/registrations'}
  devise_scope :teacher do
    get 'teachers/edit', to: 'teachers/registrations#edit', as: :edit_teacher_registration
    put 'teachers', to: 'teachers/registrations#update', as: :teacher_registration
  end
  root 'tops#show'
  resource :top, only: [:show]
  namespace :admins do
    resources :teachers, only: %i[index new create destroy]
  end
  resource :admin, only: [:show]
  resource :student, only: [:show]
  resource :teacher, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
