Rails.application.routes.draw do
  post 'publish', to: 'messages#publish'
end
