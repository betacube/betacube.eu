BetacubeEu::Application.routes.draw do
  # Root
    root :to => "home#index"
    match "/", to: "contents#show", as: :home

  # Content
    [
      "/about",
      "/contact",
      "meetups/hyperlink",
      "meetups/hyperlink_1",
      "meetups/hyperlink_2",
      "meetups/hyperlink_3",
      "meetups/hyperlink_4",
      "/events/show_and_tell",
      "/events/show_and_tell/next",
      "/events/show_and_tell/past/20120419",
      "/events/show_and_tell/past/20120906",
      "/events/show_and_tell/past/20130418",
      "/events/students_fair",
      "/events/meetups",
      "/events/meetups/past",
      "/events/hackathon",
      "/open_source",
      "/sponsors"
    ].each do |url|
      match url, to: "contents#show"
    end

  # Contact
    match "/contact/submit", to: "contact_forms#submit"

  # Authentication
    resources :sessions, only: [:new, :create, :destroy]
    match "/signup", to: "users#new"
    match "/login", to: "sessions#new"
    match "/logout", to: "sessions#destroy", via: :delete

end
