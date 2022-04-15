Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/user_sign_up", { :controller => "users", :action => "new_registration_form"})

  get("/insert_user_record", { :controller => "users", :action => "create"})

  get("/users/welcome/:path_username", { :controller => "users", :action => "user_page"})

  get("/users/:path_username", { :controller => "users", :action => "landing_page"})

  get("/user_sign_out", { :controller => "users", :action => "end_session"})

  get("/user_sign_in", { :controller => "users", :action => "start_session"})

  post("/verify_credentials", { :controller => "users", :action => "authenticate"})

  get("/1_male_under_casual", { :controller => "clothing", :action => "explore"})

  get("/2_male_under_casual", { :controller => "clothing", :action => "explore"})

  get("/1_male_under_formal", { :controller => "clothing", :action => "explore"})

  get("/2_male_under_formal", { :controller => "clothing", :action => "explore"})

  post("/new_choices", { :controller => "users", :action => "new_choices"})


end
