# == Route Map
#
#                          Prefix Verb     URI Pattern                                                    Controller#Action
#             new_v1_user_session GET      /v1/auth/sign_in(.:format)                                     devise_token_auth/sessions#new {:subdomain=>"api"}
#                 v1_user_session POST     /v1/auth/sign_in(.:format)                                     devise_token_auth/sessions#create {:subdomain=>"api"}
#         destroy_v1_user_session DELETE   /v1/auth/sign_out(.:format)                                    devise_token_auth/sessions#destroy {:subdomain=>"api"}
#            new_v1_user_password GET      /v1/auth/password/new(.:format)                                devise_token_auth/passwords#new {:subdomain=>"api"}
#           edit_v1_user_password GET      /v1/auth/password/edit(.:format)                               devise_token_auth/passwords#edit {:subdomain=>"api"}
#                v1_user_password PATCH    /v1/auth/password(.:format)                                    devise_token_auth/passwords#update {:subdomain=>"api"}
#                                 PUT      /v1/auth/password(.:format)                                    devise_token_auth/passwords#update {:subdomain=>"api"}
#                                 POST     /v1/auth/password(.:format)                                    devise_token_auth/passwords#create {:subdomain=>"api"}
#     cancel_v1_user_registration GET      /v1/auth/cancel(.:format)                                      devise_token_auth/registrations#cancel {:subdomain=>"api"}
#        new_v1_user_registration GET      /v1/auth/sign_up(.:format)                                     devise_token_auth/registrations#new {:subdomain=>"api"}
#       edit_v1_user_registration GET      /v1/auth/edit(.:format)                                        devise_token_auth/registrations#edit {:subdomain=>"api"}
#            v1_user_registration PATCH    /v1/auth(.:format)                                             devise_token_auth/registrations#update {:subdomain=>"api"}
#                                 PUT      /v1/auth(.:format)                                             devise_token_auth/registrations#update {:subdomain=>"api"}
#                                 DELETE   /v1/auth(.:format)                                             devise_token_auth/registrations#destroy {:subdomain=>"api"}
#                                 POST     /v1/auth(.:format)                                             devise_token_auth/registrations#create {:subdomain=>"api"}
#        new_v1_user_confirmation GET      /v1/auth/confirmation/new(.:format)                            devise_token_auth/confirmations#new {:subdomain=>"api"}
#            v1_user_confirmation GET      /v1/auth/confirmation(.:format)                                devise_token_auth/confirmations#show {:subdomain=>"api"}
#                                 POST     /v1/auth/confirmation(.:format)                                devise_token_auth/confirmations#create {:subdomain=>"api"}
#          v1_auth_validate_token GET      /v1/auth/validate_token(.:format)                              devise_token_auth/token_validations#validate_token
#                 v1_auth_failure GET      /v1/auth/failure(.:format)                                     devise_token_auth/omniauth_callbacks#omniauth_failure
#                                 GET      /v1/auth/:provider/callback(.:format)                          devise_token_auth/omniauth_callbacks#omniauth_success
#                                 GET|POST /omniauth/:provider/callback(.:format)                         devise_token_auth/omniauth_callbacks#redirect_callbacks
#                omniauth_failure GET|POST /omniauth/failure(.:format)                                    devise_token_auth/omniauth_callbacks#omniauth_failure
#                                 GET      /v1/auth/:provider(.:format)                                   redirect(301)
#          v1_campground_api_keys GET      /v1/campgrounds/:campground_id/api_keys(.:format)              api/v1/api_keys#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/api_keys(.:format)              api/v1/api_keys#create {:subdomain=>"api"}
#           v1_campground_api_key GET      /v1/campgrounds/:campground_id/api_keys/:id(.:format)          api/v1/api_keys#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/api_keys/:id(.:format)          api/v1/api_keys#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/api_keys/:id(.:format)          api/v1/api_keys#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/api_keys/:id(.:format)          api/v1/api_keys#destroy {:subdomain=>"api"}
#          v1_campground_bookings GET      /v1/campgrounds/:campground_id/bookings(.:format)              api/v1/bookings#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/bookings(.:format)              api/v1/bookings#create {:subdomain=>"api"}
#           v1_campground_booking GET      /v1/campgrounds/:campground_id/bookings/:id(.:format)          api/v1/bookings#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/bookings/:id(.:format)          api/v1/bookings#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/bookings/:id(.:format)          api/v1/bookings#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/bookings/:id(.:format)          api/v1/bookings#destroy {:subdomain=>"api"}
#           v1_campground_clients GET      /v1/campgrounds/:campground_id/clients(.:format)               api/v1/clients#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/clients(.:format)               api/v1/clients#create {:subdomain=>"api"}
#            v1_campground_client GET      /v1/campgrounds/:campground_id/clients/:id(.:format)           api/v1/clients#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/clients/:id(.:format)           api/v1/clients#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/clients/:id(.:format)           api/v1/clients#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/clients/:id(.:format)           api/v1/clients#destroy {:subdomain=>"api"}
#          v1_campground_payments GET      /v1/campgrounds/:campground_id/payments(.:format)              api/v1/payments#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/payments(.:format)              api/v1/payments#create {:subdomain=>"api"}
#           v1_campground_payment GET      /v1/campgrounds/:campground_id/payments/:id(.:format)          api/v1/payments#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/payments/:id(.:format)          api/v1/payments#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/payments/:id(.:format)          api/v1/payments#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/payments/:id(.:format)          api/v1/payments#destroy {:subdomain=>"api"}
#            v1_campground_people GET      /v1/campgrounds/:campground_id/people(.:format)                api/v1/people#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/people(.:format)                api/v1/people#create {:subdomain=>"api"}
#            v1_campground_person GET      /v1/campgrounds/:campground_id/people/:id(.:format)            api/v1/people#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/people/:id(.:format)            api/v1/people#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/people/:id(.:format)            api/v1/people#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/people/:id(.:format)            api/v1/people#destroy {:subdomain=>"api"}
#            v1_campground_prices GET      /v1/campgrounds/:campground_id/prices(.:format)                api/v1/prices#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/prices(.:format)                api/v1/prices#create {:subdomain=>"api"}
#             v1_campground_price GET      /v1/campgrounds/:campground_id/prices/:id(.:format)            api/v1/prices#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/prices/:id(.:format)            api/v1/prices#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/prices/:id(.:format)            api/v1/prices#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/prices/:id(.:format)            api/v1/prices#destroy {:subdomain=>"api"}
# v1_campground_rental_categories GET      /v1/campgrounds/:campground_id/rental_categories(.:format)     api/v1/rental_categories#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/rental_categories(.:format)     api/v1/rental_categories#create {:subdomain=>"api"}
#   v1_campground_rental_category GET      /v1/campgrounds/:campground_id/rental_categories/:id(.:format) api/v1/rental_categories#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/rental_categories/:id(.:format) api/v1/rental_categories#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/rental_categories/:id(.:format) api/v1/rental_categories#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/rental_categories/:id(.:format) api/v1/rental_categories#destroy {:subdomain=>"api"}
#           v1_campground_rentals GET      /v1/campgrounds/:campground_id/rentals(.:format)               api/v1/rentals#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/rentals(.:format)               api/v1/rentals#create {:subdomain=>"api"}
#            v1_campground_rental GET      /v1/campgrounds/:campground_id/rentals/:id(.:format)           api/v1/rentals#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/rentals/:id(.:format)           api/v1/rentals#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/rentals/:id(.:format)           api/v1/rentals#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/rentals/:id(.:format)           api/v1/rentals#destroy {:subdomain=>"api"}
#           v1_campground_seasons GET      /v1/campgrounds/:campground_id/seasons(.:format)               api/v1/seasons#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/seasons(.:format)               api/v1/seasons#create {:subdomain=>"api"}
#            v1_campground_season GET      /v1/campgrounds/:campground_id/seasons/:id(.:format)           api/v1/seasons#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/seasons/:id(.:format)           api/v1/seasons#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/seasons/:id(.:format)           api/v1/seasons#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/seasons/:id(.:format)           api/v1/seasons#destroy {:subdomain=>"api"}
#            v1_campground_rights GET      /v1/campgrounds/:campground_id/rights(.:format)                api/v1/rights#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds/:campground_id/rights(.:format)                api/v1/rights#create {:subdomain=>"api"}
#             v1_campground_right GET      /v1/campgrounds/:campground_id/rights/:id(.:format)            api/v1/rights#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:campground_id/rights/:id(.:format)            api/v1/rights#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:campground_id/rights/:id(.:format)            api/v1/rights#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:campground_id/rights/:id(.:format)            api/v1/rights#destroy {:subdomain=>"api"}
#                  v1_campgrounds GET      /v1/campgrounds(.:format)                                      api/v1/campgrounds#index {:subdomain=>"api"}
#                                 POST     /v1/campgrounds(.:format)                                      api/v1/campgrounds#create {:subdomain=>"api"}
#                   v1_campground GET      /v1/campgrounds/:id(.:format)                                  api/v1/campgrounds#show {:subdomain=>"api"}
#                                 PATCH    /v1/campgrounds/:id(.:format)                                  api/v1/campgrounds#update {:subdomain=>"api"}
#                                 PUT      /v1/campgrounds/:id(.:format)                                  api/v1/campgrounds#update {:subdomain=>"api"}
#                                 DELETE   /v1/campgrounds/:id(.:format)                                  api/v1/campgrounds#destroy {:subdomain=>"api"}
#                        v1_users GET      /v1/users(.:format)                                            api/v1/users#index {:subdomain=>"api"}
#                                 POST     /v1/users(.:format)                                            api/v1/users#create {:subdomain=>"api"}
#                         v1_user GET      /v1/users/:id(.:format)                                        api/v1/users#show {:subdomain=>"api"}
#                                 PATCH    /v1/users/:id(.:format)                                        api/v1/users#update {:subdomain=>"api"}
#                                 PUT      /v1/users/:id(.:format)                                        api/v1/users#update {:subdomain=>"api"}
#                                 DELETE   /v1/users/:id(.:format)                                        api/v1/users#destroy {:subdomain=>"api"}
#

Rails.application.routes.draw do
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'

        resources :campgrounds do
          resources :api_keys
          resources :bookings
          resources :clients
          resources :payments
          resources :people
          resources :prices
          resources :rental_categories
          resources :rentals
          resources :seasons
          resources :rights
          resources :users
        end

      end
    end
  end
end
