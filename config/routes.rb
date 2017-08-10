Rails.application.routes.draw do
  #devise_for :users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { :registrations => 'registrations'}.merge(ActiveAdmin::Devise.config)
   ActiveAdmin.routes(self)
  #ActiveAdmin.routes(self)
  #ActiveAdmin.routes(self)
  resources :teachers
  resources :departments
  resources :students
  resources :courses
  #devise_for :users, :controllers => { :registrations => 'registrations'}
  resources :users
  resources :subjects
  resources :curriculums
  resources :teaching_loads
  resources :blocks
  resources :sections
  resources :class_lists
  resources :activities
  resources :comments
  resources :grades
  resources :home
  
  
  devise_scope :user do
    get "/teacher-signup" =>"registrations#teacher"
   post  "/teacher-signup"   => "registrations#create"
   get "/student-signup" =>"registrations#student"
  post  "/student-signup"   => "registrations#create"
   # get "student_users", to: "users/students#new", as: "new_student_user"
    #post "student_users", to: "users/students#create", as: "student_users"
    #get "student_users/edit", to: "users/students#edit", as: "edit_student_users"
    #put "student_users", to: "users/students#update"
    #patch "student_users", to: "users/students#update"
  end
  
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
