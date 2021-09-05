Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :students, controllers: { sessions: 'students/sessions', registrations: 'students/registrations' }
  devise_for :teachers, controllers: { sessions: 'teachers/sessions', registrations: 'teachers/registrations' }
  devise_scope :admin do
    post 'admins/sign_in_as_a_teacher', to: 'admins/sessions#sign_in_as_a_teacher', as: :admins_sign_in_as_a_teacher
  end
  devise_scope :teacher do
    get 'teachers/edit', to: 'teachers/registrations#edit', as: :edit_teacher_registration
    put 'teachers', to: 'teachers/registrations#update', as: :teacher_registration
  end
  root 'tops#show'
  resource :top, only: [:show]
  namespace :admins do
    resources :teachers, only: %i[index new create destroy]
    resources :languages, only: [:index]
    resource :time_reservation_rate, only: [:show]
    resource :teacher_reservation_rate, only: [:show]
    resource :language_reservation_rate, only: [:show]
  end
  namespace :students do
    resources :purchase_tickets, only: %i[new create]
    resources :lesson_reservations, only: %i[create destroy]
    resources :lessons, only: %i[index]
    resources :reserved_lessons, only: %i[index show]
    resources :past_lessons, only: %i[index]
    resource :teacher_review, only: %i[show]
    resources :choice_monthly_plans, only: %i[new create show edit update destroy]
  end
  namespace :teachers do
    resources :lessons
    resources :reserved_lessons, only: %i[index show]
    resources :past_lessons, only: %i[index show]
    resources :student_past_lessons, only: %i[index show]
    resources :multiple_lessons, only: %i[new create]
    resources :time_range_lessons, only: %i[new create]
    resources :reviews, only: %i[new create show edit update destroy]
  end
  resource :admin, only: [:show]
  resource :student, only: [:show]
  resource :teacher, only: [:show]
end
