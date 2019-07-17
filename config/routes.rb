Rails.application.routes.draw do
  
  get 'commercial_payments', to: 'pages#commercial-payments'
  get 'healthcare_savings', to: 'pages#healthcare-savings'
  get 'instant_pay', to: 'pages#instant-pay'
  get 'home', to: 'pages#home'
  get 'docs', to: 'pages#docs'
  get 'marketing', to: 'pages#marketing'
  get 'references', to: 'pages#references'
  get 'articles', to: 'pages#articles'
  get 'training', to: 'pages#training'
  get 'cps_answers', to: 'pages#cps_answers'
  get 'email-sequences', to: 'pages#email-sequences'
  get 'cps_email_sequence', to: 'pages#cps_email_sequence'
  get 'cps_email_to_meetings', to: 'pages#cps_email_to_meetings'
  get 'cps_phone_script', to: 'pages#cps_phone_script'
  get 'invite-webinar', to: 'pages#invite-webinar'
  get 'cps_steps_to_sale', to: 'pages#cps_steps_to_sale'
  get 'cps_training_vids', to: 'pages#cps_training_vids'
  get 'lead-generation', to: 'pages#lead-generation'
  get 'lead-generation-faq', to: 'pages#lead-generation-faq'
  get 'intelatek', to: 'prospects#intelatek'
  # get 'dashboard', to: 'prospects#dashboard'
  get 'dashboard', to: 'application#dashboard'
  get :new_lead, to: 'prospects#new_lead', as: :new_lead
  post :new_lead, to: 'prospects#new_lead_create', as: :new_lead_create
  get 'hcsq/:id', to: 'prospects#hcsq', as: :hcsq
  post 'hcsq/:id', to: 'prospects#hcsq_update', as: :hcsq_update
  get 'hcs/:id', to: 'prospects#hcs', as: :hcs
  post 'hcs/:id', to: 'prospects#hcs_update', as: :hcs_update  
  get 'cps/:id', to: 'prospects#cps', as: :cps
  post 'cps/:id', to: 'prospects#cps_update', as: :cps_update
  get 'pay/:id', to: 'prospects#pay', as: :pay
  post 'pay/:id', to: 'prospects#pay_update', as: :pay_update
  match '/users',     to: 'users#index',  via: 'get'
  match '/users/:id', to: 'users#show',   via: 'get'
  get 'group_message', to: 'users#group_message'

  resources :users

  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'
  resources :prospects do
    resources :comments
  end
  # root 'pages#home'
  root 'users#start_page'
end