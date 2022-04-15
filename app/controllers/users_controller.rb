class UsersController < ApplicationController 


  def index 

    render({ :template => "user_templates/index.html.erb"})
  
  end
  
  def new_registration_form
    #@user = User.new
    render({ :template => "user_templates/sign_up.html.erb"})
  end 

 def create
 user = User.new
 user.username = params.fetch("input_username")
 user.password = params.fetch("input_password")
 user.password_confirmation = params.fetch("input_password_confirmation")
 user.price = params.fetch("input_price")
 user.sex = params.fetch("input_sex")
 user.age = params.fetch("input_age")
 user.use = params.fetch("input_use")
 

  save_status = user.save 

    if save_status == true 
      session.store(:user_id, user.id)

      redirect_to("/users/welcome/#{user.username}", {:notice => "Thanks for signing up!"})
    else 
      redirect_to("/")
   
    end


  end

  def user_page

    render({ :template => "user_templates/user_page.html.erb"})

  end

  def end_session
    reset_session
    redirect_to("/", { :notice => "Thanks for shopping!"})
  end

  def start_session

    render({ :template => "user_templates/sign_in_form.html.erb"})

  end

  def authenticate
    un = params.fetch("input_username")
    pw = params.fetch("input_password")

    user = User.where({ :username => un }).at(0)

    if user == nil 
      redirect_to("/user_sign_in_form")
    else
      if user.authenticate(pw)
        session.store( :user_id, user.id)
      redirect_to("/users/#{user.username}")
      
    end
    end
  end

  def learn 
    user = User.new
    user.sex = params.fetch("input_sex")
    user.save
  
    redirect_to("/")
  end 

  def landing_page 
    
    render({ :template => "user_templates/landing_page"})
  end

  def new_choices
    un = params.fetch("input_username")
    u = User.where({ :username => un }).at(0)
  
    u.price = params.fetch("input_price")
    u.sex = params.fetch("input_sex")
    u.age = params.fetch("input_age")
    u.use = params.fetch("input_use")

    u.save
    
    if u.price == 1 && u.use == "casual"
    render({ :template => "clothing_templates/1_male_under_casual.html.erb"})
    else
      if u.price == 2 && u.use == "casual"
    render({ :template => "clothing_templates/2_male_under_casual.html.erb"})
    else
      if u.price == 1 && u.use == "formal"
      render({ :template => "clothing_templates/1_male_under_formal.html.erb"})
    else
      if u.price == 2 && u.use == "formal"
    render({ :template => "clothing_templates/2_male_under_formal.html.erb"})
    end
  end
  end

  
  end
  
  end

  




end
