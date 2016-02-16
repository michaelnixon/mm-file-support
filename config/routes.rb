FileSupportMovingstories::Application.routes.draw do
  root 'projects#index'
  get '/404' => 'errors#not_found'
  get '/500' => 'errors#internal_error'
  get '/422' => 'errors#unprocessable_entity'  
  apipie
  get "password_resets/new"
  get "pages/about"
  get "pages/contact"
  get "pages/howto"  
  # get '/data_tracks/provide', to: 'data_tracks#provide'
  # post '/data_tracks/import', to: 'data_tracks#import'
  get "myprojects" => "projects#mine", :as => "myprojects"
  get "movement_annotations/for"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "tracks_ajax" => "data_tracks#index_data_tables", :as => "tracks_ajax"
  get "takes_ajax" => "takes#index_data_tables", :as => "takes_ajax"
  #export routes need to be above the resources 
  get "projects/export"
  get "movement_groups/export"
  get "takes/export"

  ##################New Routes Added from Template############
  # You can have the root of your site routed with "root"
  #root to: 'dashboards#dashboard_1'

  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"

  get "layoutsoptions/index"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/peity"
  get "graphs/sparkline"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/file_menager"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"

  get "pages/search_results"
  get "pages/lockscreen"
  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"

  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/notifications_tooltips"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/jqgrid"

  get "gallery/basic_gallery"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"


  ##############################


  resources :sensor_types
  resources :movers
  resources :access_groups
  resources :movement_annotations
  resources :data_tracks
  resources :movement_groups
  resources :projects do
    post 'make_public', on: :member
  end
  resources :takes  
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, except: [:index]  
  match 'tagged' => 'movement_groups#tagged', :via => [:get], :as => 'tagged'
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
end
