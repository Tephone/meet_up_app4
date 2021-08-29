Rails.application.routes.draw do
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
  namespace :students do
    resources :purchase_tickets, only: %i[new create]
    resources :lesson_reservations, only: %i[create destroy]
    resources :lessons, only: %i[index]
    resources :reserved_lessons, only: %i[index show]
    resources :past_lessons, only: %i[index]
  end
  resource :student, only: [:show]
  namespace :teachers do
    resources :lessons
    resources :past_lessons, only: %i[index show]
  end
  resource :teacher, only: [:show]
end
