Payslip::Application.routes.draw do
  root 'home#index'

  resources :employees

end


