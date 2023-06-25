Rails.application.routes.draw do
  get '/project/sections', to: 'homes#index', as: 'get_sections'
  get 'edit/section/:id', to: 'homes#edit', as: 'edit_section'
  post 'update/section/:id', to: 'homes#update', as: 'update_section'
  get '/project/section/new', to: "homes#new", as: 'new_section'
  post '/project/sections', to: 'homes#create', as: 'create_section'
  get '/project/delete/section/:id', to: 'homes#destroy', as: 'destroy_section'
  get '/project/section/task/edit/:id', to: 'homes#edit_task', as: 'edit_task'
  post '/project/section/task/update/:id', to: 'homes#update_section_task', as: 'update_task'
  
  root to: 'homes#index'
end
