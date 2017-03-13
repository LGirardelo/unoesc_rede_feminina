Rails.application.routes.draw do
  
  resources :people
  resources :quizzes
  resources :questions
  root to: "home#index"
  devise_for :users
  resources :patients do
    member do
      get :obtained
    end
  end
  resources :profissionals
  get 'birthday' => "people#check_birthday"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
