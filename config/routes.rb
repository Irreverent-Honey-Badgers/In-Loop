#                      Prefix Verb   URI Pattern                                     Controller#Action
#          new_doctor_session GET    /doctors/sign_in(.:format)                      devise/sessions#new
#              doctor_session POST   /doctors/sign_in(.:format)                      devise/sessions#create
#      destroy_doctor_session DELETE /doctors/sign_out(.:format)                     devise/sessions#destroy
#             doctor_password POST   /doctors/password(.:format)                     devise/passwords#create
#         new_doctor_password GET    /doctors/password/new(.:format)                 devise/passwords#new
#        edit_doctor_password GET    /doctors/password/edit(.:format)                devise/passwords#edit
#                             PATCH  /doctors/password(.:format)                     devise/passwords#update
#                             PUT    /doctors/password(.:format)                     devise/passwords#update
#  cancel_doctor_registration GET    /doctors/cancel(.:format)                       devise/registrations#cancel
#         doctor_registration POST   /doctors(.:format)                              devise/registrations#create
#     new_doctor_registration GET    /doctors/sign_up(.:format)                      devise/registrations#new
#    edit_doctor_registration GET    /doctors/edit(.:format)                         devise/registrations#edit
#                             PATCH  /doctors(.:format)                              devise/registrations#update
#                             PUT    /doctors(.:format)                              devise/registrations#update
#                             DELETE /doctors(.:format)                              devise/registrations#destroy
#         new_patient_session GET    /patients/sign_in(.:format)                     devise/sessions#new
#             patient_session POST   /patients/sign_in(.:format)                     devise/sessions#create
#     destroy_patient_session DELETE /patients/sign_out(.:format)                    devise/sessions#destroy
#            patient_password POST   /patients/password(.:format)                    devise/passwords#create
#        new_patient_password GET    /patients/password/new(.:format)                devise/passwords#new
#       edit_patient_password GET    /patients/password/edit(.:format)               devise/passwords#edit
#                             PATCH  /patients/password(.:format)                    devise/passwords#update
#                             PUT    /patients/password(.:format)                    devise/passwords#update
# cancel_patient_registration GET    /patients/cancel(.:format)                      devise/registrations#cancel
#        patient_registration POST   /patients(.:format)                             devise/registrations#create
#    new_patient_registration GET    /patients/sign_up(.:format)                     devise/registrations#new
#   edit_patient_registration GET    /patients/edit(.:format)                        devise/registrations#edit
#                             PATCH  /patients(.:format)                             devise/registrations#update
#                             PUT    /patients(.:format)                             devise/registrations#update
#                             DELETE /patients(.:format)                             devise/registrations#destroy
#                             GET    /patient/auth/:provider/callback(.:format)      authentications#google_oauth2
#                             GET    /doctor/auth/:provider/callback(.:format)       authentications#google_oauth2
#        google_oauth2_doctor GET    /doctor/auth/:provider(.:format)                authentications#google_oauth2
#       google_oauth2_patient GET    /patient/auth/:provider(.:format)               authentications#google_oauth2
#                        root GET    /                                               application#index
#         p_omniauth_patients GET    /patients/patient(.:format)                     patients#omniauth
#                 eta_patient POST   /patients/:id/eta(.:format)                     patients#eta
#   find_appointments_patient GET    /patients/:id/find_appointments(.:format)       patients#find_appointments
#                    patients GET    /patients(.:format)                             patients#index
#                     patient GET    /patients/:id(.:format)                         patients#show
#          d_omniauth_doctors GET    /doctors/doctor(.:format)                       doctors#omniauth
#          get_patient_doctor GET    /doctors/:id/get_patient(.:format)              doctors#get_patient
#     send_appointment_doctor POST   /doctors/:id/send_appointment(.:format)         doctors#send_appointment
#         find_patient_doctor POST   /doctors/:id/find_patient/:patient_id(.:format) doctors#find_patient
#                     doctors GET    /doctors(.:format)                              doctors#index
#                      doctor GET    /doctors/:id(.:format)                          doctors#show

Rails.application.routes.draw do

  devise_for :doctors
  devise_for :patients
  get "/patient/auth/:provider/callback" => "authentications#google_oauth2"
  get "/doctor/auth/:provider/callback" => "authentications#google_oauth2"
  get "/doctor/auth/:provider" => "authentications#google_oauth2", as: 'google_oauth2_doctor'
  get "/patient/auth/:provider" => "authentications#google_oauth2", as: 'google_oauth2_patient'

  root "application#index"
  resources :patients, only: [:index, :show] do
    collection do
      get 'patient' => 'patients#omniauth', as: 'p_omniauth'
    end
    member do
      post '/eta' => 'patients#eta', as: 'eta'
      get '/find_appointments' => 'patients#find_appointments',as: :'find_appointments'
    end
  end
  resources :doctors, only: [:index, :show] do
    collection do
      get 'doctor' => 'doctors#omniauth', as: 'd_omniauth'
    end
    member do
      get '/get_patient' => 'doctors#get_patient', as: 'get_patient'
      post '/send_appointment' => 'doctors#send_appointment',as: 'send_appointment'
      post '/find_patient/:patient_id' => 'doctors#find_patient', as: 'find_patient'
    end
  end
  # The priority is based upon order of creatio first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
