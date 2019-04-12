Rails.application.routes.draw do
   resources :categories
   resources :products #route for index, new
   # get 'categories/index'
   get 'say/hello'
   get 'say/goodbye'
   root 'say#hello'  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
