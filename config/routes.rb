Rails.application.routes.draw do
  root 'homes#index'
  resources :doctors, :patients, :appointments
end
