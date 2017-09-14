# == Route Map
#
#                                      Prefix Verb     URI Pattern                                                                                                  Controller#Action
#                         new_v1_user_session GET      /v1/auth/sign_in(.:format)                                                                                   devise_token_auth/sessions#new
#                             v1_user_session POST     /v1/auth/sign_in(.:format)                                                                                   devise_token_auth/sessions#create
#                     destroy_v1_user_session DELETE   /v1/auth/sign_out(.:format)                                                                                  devise_token_auth/sessions#destroy
#                        new_v1_user_password GET      /v1/auth/password/new(.:format)                                                                              devise_token_auth/passwords#new
#                       edit_v1_user_password GET      /v1/auth/password/edit(.:format)                                                                             devise_token_auth/passwords#edit
#                            v1_user_password PATCH    /v1/auth/password(.:format)                                                                                  devise_token_auth/passwords#update
#                                             PUT      /v1/auth/password(.:format)                                                                                  devise_token_auth/passwords#update
#                                             POST     /v1/auth/password(.:format)                                                                                  devise_token_auth/passwords#create
#                 cancel_v1_user_registration GET      /v1/auth/cancel(.:format)                                                                                    devise_token_auth/registrations#cancel
#                    new_v1_user_registration GET      /v1/auth/sign_up(.:format)                                                                                   devise_token_auth/registrations#new
#                   edit_v1_user_registration GET      /v1/auth/edit(.:format)                                                                                      devise_token_auth/registrations#edit
#                        v1_user_registration PATCH    /v1/auth(.:format)                                                                                           devise_token_auth/registrations#update
#                                             PUT      /v1/auth(.:format)                                                                                           devise_token_auth/registrations#update
#                                             DELETE   /v1/auth(.:format)                                                                                           devise_token_auth/registrations#destroy
#                                             POST     /v1/auth(.:format)                                                                                           devise_token_auth/registrations#create
#                    new_v1_user_confirmation GET      /v1/auth/confirmation/new(.:format)                                                                          devise_token_auth/confirmations#new
#                        v1_user_confirmation GET      /v1/auth/confirmation(.:format)                                                                              devise_token_auth/confirmations#show
#                                             POST     /v1/auth/confirmation(.:format)                                                                              devise_token_auth/confirmations#create
#                      v1_auth_validate_token GET      /v1/auth/validate_token(.:format)                                                                            devise_token_auth/token_validations#validate_token
#                             v1_auth_failure GET      /v1/auth/failure(.:format)                                                                                   devise_token_auth/omniauth_callbacks#omniauth_failure
#                                             GET      /v1/auth/:provider/callback(.:format)                                                                        devise_token_auth/omniauth_callbacks#omniauth_success
#                                             GET|POST /omniauth/:provider/callback(.:format)                                                                       devise_token_auth/omniauth_callbacks#redirect_callbacks
#                            omniauth_failure GET|POST /omniauth/failure(.:format)                                                                                  devise_token_auth/omniauth_callbacks#omniauth_failure
#                                             GET      /v1/auth/:provider(.:format)                                                                                 redirect(301)
#                      v1_campground_api_keys GET      /v1/campgrounds/:campground_id/api_keys(.:format)                                                            api/v1/api_keys#index
#                                             POST     /v1/campgrounds/:campground_id/api_keys(.:format)                                                            api/v1/api_keys#create
#                       v1_campground_api_key GET      /v1/campgrounds/:campground_id/api_keys/:id(.:format)                                                        api/v1/api_keys#show
#                                             PATCH    /v1/campgrounds/:campground_id/api_keys/:id(.:format)                                                        api/v1/api_keys#update
#                                             PUT      /v1/campgrounds/:campground_id/api_keys/:id(.:format)                                                        api/v1/api_keys#update
#                                             DELETE   /v1/campgrounds/:campground_id/api_keys/:id(.:format)                                                        api/v1/api_keys#destroy
#                      v1_campground_bookings GET      /v1/campgrounds/:campground_id/bookings(.:format)                                                            api/v1/bookings#index
#                                             POST     /v1/campgrounds/:campground_id/bookings(.:format)                                                            api/v1/bookings#create
#                       v1_campground_booking GET      /v1/campgrounds/:campground_id/bookings/:id(.:format)                                                        api/v1/bookings#show
#                                             PATCH    /v1/campgrounds/:campground_id/bookings/:id(.:format)                                                        api/v1/bookings#update
#                                             PUT      /v1/campgrounds/:campground_id/bookings/:id(.:format)                                                        api/v1/bookings#update
#                                             DELETE   /v1/campgrounds/:campground_id/bookings/:id(.:format)                                                        api/v1/bookings#destroy
#                       v1_campground_clients GET      /v1/campgrounds/:campground_id/clients(.:format)                                                             api/v1/clients#index
#                                             POST     /v1/campgrounds/:campground_id/clients(.:format)                                                             api/v1/clients#create
#                        v1_campground_client GET      /v1/campgrounds/:campground_id/clients/:id(.:format)                                                         api/v1/clients#show
#                                             PATCH    /v1/campgrounds/:campground_id/clients/:id(.:format)                                                         api/v1/clients#update
#                                             PUT      /v1/campgrounds/:campground_id/clients/:id(.:format)                                                         api/v1/clients#update
#                                             DELETE   /v1/campgrounds/:campground_id/clients/:id(.:format)                                                         api/v1/clients#destroy
#                      v1_campground_payments GET      /v1/campgrounds/:campground_id/payments(.:format)                                                            api/v1/payments#index
#                                             POST     /v1/campgrounds/:campground_id/payments(.:format)                                                            api/v1/payments#create
#                       v1_campground_payment GET      /v1/campgrounds/:campground_id/payments/:id(.:format)                                                        api/v1/payments#show
#                                             PATCH    /v1/campgrounds/:campground_id/payments/:id(.:format)                                                        api/v1/payments#update
#                                             PUT      /v1/campgrounds/:campground_id/payments/:id(.:format)                                                        api/v1/payments#update
#                                             DELETE   /v1/campgrounds/:campground_id/payments/:id(.:format)                                                        api/v1/payments#destroy
#       v1_campground_rental_category_rentals GET      /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/rentals(.:format)                       api/v1/rentals#index
#                                             POST     /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/rentals(.:format)                       api/v1/rentals#create
#        v1_campground_rental_category_rental GET      /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/rentals/:id(.:format)                   api/v1/rentals#show
#                                             PATCH    /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/rentals/:id(.:format)                   api/v1/rentals#update
#                                             PUT      /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/rentals/:id(.:format)                   api/v1/rentals#update
#                                             DELETE   /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/rentals/:id(.:format)                   api/v1/rentals#destroy
# v1_campground_rental_category_season_prices GET      /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/seasons/:season_id/prices(.:format)     api/v1/prices#index
#                                             POST     /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/seasons/:season_id/prices(.:format)     api/v1/prices#create
#  v1_campground_rental_category_season_price GET      /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/seasons/:season_id/prices/:id(.:format) api/v1/prices#show
#                                             PATCH    /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/seasons/:season_id/prices/:id(.:format) api/v1/prices#update
#                                             PUT      /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/seasons/:season_id/prices/:id(.:format) api/v1/prices#update
#                                             DELETE   /v1/campgrounds/:campground_id/rental_categories/:rental_category_id/seasons/:season_id/prices/:id(.:format) api/v1/prices#destroy
#             v1_campground_rental_categories GET      /v1/campgrounds/:campground_id/rental_categories(.:format)                                                   api/v1/rental_categories#index
#                                             POST     /v1/campgrounds/:campground_id/rental_categories(.:format)                                                   api/v1/rental_categories#create
#               v1_campground_rental_category GET      /v1/campgrounds/:campground_id/rental_categories/:id(.:format)                                               api/v1/rental_categories#show
#                                             PATCH    /v1/campgrounds/:campground_id/rental_categories/:id(.:format)                                               api/v1/rental_categories#update
#                                             PUT      /v1/campgrounds/:campground_id/rental_categories/:id(.:format)                                               api/v1/rental_categories#update
#                                             DELETE   /v1/campgrounds/:campground_id/rental_categories/:id(.:format)                                               api/v1/rental_categories#destroy
#                       v1_campground_seasons GET      /v1/campgrounds/:campground_id/seasons(.:format)                                                             api/v1/seasons#index
#                                             POST     /v1/campgrounds/:campground_id/seasons(.:format)                                                             api/v1/seasons#create
#                        v1_campground_season GET      /v1/campgrounds/:campground_id/seasons/:id(.:format)                                                         api/v1/seasons#show
#                                             PATCH    /v1/campgrounds/:campground_id/seasons/:id(.:format)                                                         api/v1/seasons#update
#                                             PUT      /v1/campgrounds/:campground_id/seasons/:id(.:format)                                                         api/v1/seasons#update
#                                             DELETE   /v1/campgrounds/:campground_id/seasons/:id(.:format)                                                         api/v1/seasons#destroy
#                        v1_campground_rights GET      /v1/campgrounds/:campground_id/rights(.:format)                                                              api/v1/rights#index
#                                             POST     /v1/campgrounds/:campground_id/rights(.:format)                                                              api/v1/rights#create
#                         v1_campground_right GET      /v1/campgrounds/:campground_id/rights/:id(.:format)                                                          api/v1/rights#show
#                                             PATCH    /v1/campgrounds/:campground_id/rights/:id(.:format)                                                          api/v1/rights#update
#                                             PUT      /v1/campgrounds/:campground_id/rights/:id(.:format)                                                          api/v1/rights#update
#                                             DELETE   /v1/campgrounds/:campground_id/rights/:id(.:format)                                                          api/v1/rights#destroy
#                         v1_campground_users GET      /v1/campgrounds/:campground_id/users(.:format)                                                               api/v1/users#index
#                                             POST     /v1/campgrounds/:campground_id/users(.:format)                                                               api/v1/users#create
#                          v1_campground_user GET      /v1/campgrounds/:campground_id/users/:id(.:format)                                                           api/v1/users#show
#                                             PATCH    /v1/campgrounds/:campground_id/users/:id(.:format)                                                           api/v1/users#update
#                                             PUT      /v1/campgrounds/:campground_id/users/:id(.:format)                                                           api/v1/users#update
#                                             DELETE   /v1/campgrounds/:campground_id/users/:id(.:format)                                                           api/v1/users#destroy
#                              v1_campgrounds GET      /v1/campgrounds(.:format)                                                                                    api/v1/campgrounds#index
#                                             POST     /v1/campgrounds(.:format)                                                                                    api/v1/campgrounds#create
#                               v1_campground GET      /v1/campgrounds/:id(.:format)                                                                                api/v1/campgrounds#show
#                                             PATCH    /v1/campgrounds/:id(.:format)                                                                                api/v1/campgrounds#update
#                                             PUT      /v1/campgrounds/:id(.:format)                                                                                api/v1/campgrounds#update
#                                             DELETE   /v1/campgrounds/:id(.:format)                                                                                api/v1/campgrounds#destroy
# 

Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :campgrounds do
        resources :api_keys
        resources :bookings
        resources :clients
        resources :payments
        resources :rental_categories do
          resources :rentals
          resources :seasons, only: [] do
            resources :prices
          end
        end
        resources :seasons
        resources :rights
        resources :users
      end

    end
  end
end
