class ClothingController < ApplicationController 

def explore 
  us_price = User.all.last.price
  us_use = User.all.last.use
  if us_price == 1 && us_use == "casual"
  render({ :template => "clothing_templates/1_male_under_casual.html.erb"})
  else
    if us_price == 2 && us_use == "casual"
  render({ :template => "clothing_templates/2_male_under_casual.html.erb"})
  else
    if us_price == 1 && us_use == "formal"
    render({ :template => "clothing_templates/1_male_under_formal.html.erb"})
  else
    if us_price == 2 && us_use == "formal"
  render({ :template => "clothing_templates/2_male_under_formal.html.erb"})
  end
end
end
end

end


end
