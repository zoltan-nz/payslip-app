PayslipApp::Application.routes.draw do
  root 'home#index'

  resources :employees do
    post :import, on: :collection
  end

  get '/payslips',          to: 'payslips#index',           as: :payslips
  post '/payslips/multiple', to: 'payslips#show_multiple',  as: :payslips_multiple
  get '/payslips/multiple', to: 'payslips#show_multiple',    as: :payslips_export_csv

end


