Rails.application.routes.draw do
  resources :pages do
    member do
      delete :delete_image_attachment
    end
  end
end
