require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative 'db_config'
require_relative 'models/profile'
require_relative 'models/tender'
require_relative 'models/tender_application'
require_relative 'models/job'
require_relative 'models/job_application'
require_relative 'models/member_offer'

enable :sessions

helpers do

  def current_user
    Profile.find_by(id: session[:user_id])
  end

  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end

end
    

get '/' do
  erb :index
end

get '/profiles' do 
  redirect '/login' unless logged_in?
  @profiles = Profile.all
  erb :profiles
end

# post '/profiles' do
#   profile = Profile.new
#   profile.user_id = current_user.id
# end
#check with dt this may create issues if creating in a cms from the backend.

get '/profiles/:id' do
  @profile = Profile.find(params[:id])
  erb :view_profile
end

get '/profiles/:id/edit' do
  @profile = Profile.find(params[:id])
  redirect '/profiles' unless current_user.id == @profile.id
  erb :update_profile
end

put '/profiles/:id' do
  profile = Profile.find(params[:id])
  profile.first_name = params[:first_name]
  profile.surname = params[:surname]
  profile.organisation = params[:organisation]
  profile.email = params[:email]
  profile.phone = params[:phone]
  profile.position = params[:position]
  profile.industry = params[:industry]
  profile.company_address = params[:company_address]
  profile.bio = params[:bio]
  profile.organisation_bio = params[:organisation_bio]
  profile.profile_picture = params[:profile_picture]
  profile.logo = params[:logo]
  profile.save
  redirect "/profiles/#{params[:id]}"
end

get '/login' do
  erb :login
end

post '/session' do 
  user = Profile.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/login'
end

get '/admin' do
  redirect '/' unless current_user.permission == "admin"
  erb :admin
end
