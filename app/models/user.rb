# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  age             :string
#  password_digest :string
#  price           :integer
#  sex             :string
#  use             :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates(:username, 
  {
    :presence => true, 
    :uniqueness => { :case_sensitive => false}
  }
    )

  has_secure_password


end
