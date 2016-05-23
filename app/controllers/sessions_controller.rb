class SessionsController < ApplicationController
  def create
    username = params[:username]
    user_password = params[:password]
    user = User.find_by(username: username)
    if user && user.authenticate(user_password)
      token = SecureRandom.base64
      loop do
        break unless PlantLoverRedis.exist?(token)
        token = SecureRandom.base64
      end
      PlantLoverRedis.set(token, user.id)
      render json: { message: 'login success ', data: token}, status: 200
    else
      render json: { errors: 'Invalid username or password'}, status: 422
    end
  end

  def destroy
    token = request.headers['HTTP_PLANLOVERTOKEN']
    PlantLoverRedis.delete(token)
    render json: { message: 'sign out successfully'}, status: 200
  end
end
