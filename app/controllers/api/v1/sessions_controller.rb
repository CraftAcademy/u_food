class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  protect_from_forgery with: :null_session

def create
    super
  end

end