ActiveAdmin.register User do

  permit_params :email, :encrypted_password, :reset_password_token

end
