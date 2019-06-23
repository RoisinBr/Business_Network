require 'sinatra'
require 'sinatra/reloader' if settings.development?
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
  @profiles = Profile.all
  erb :index
end

get '/profiles' do 
  redirect '/login' unless logged_in?
  @profiles = Profile.all
  erb :profiles
end

post '/profiles' do
  @profile = Profile.new
  @profile.password = "example"
  @profile.save
  erb :update_profile
end

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

get '/member-offers' do
  redirect '/login' unless logged_in?
  @offers = MemberOffer.all
  erb :member_offers
end

get '/member-offers/new' do
  erb :new_offer
end

post '/member-offers' do
  offer = MemberOffer.new
  offer.image = params[:image]
  offer.offer_title = params[:offer_title]
  offer.offer = params[:offer]
  offer.your_name = params[:your_name]
  offer.email = params[:email]
  offer.phone = params[:phone]
  offer.profile_id = current_user.id
  offer.save
  redirect "/member-offers"
end

get '/member-offers/:id' do
  @offer = MemberOffer.find(params[:id])
  erb :view_offer
end

get '/member-offers/:id/edit' do
  @offer = MemberOffer.find(params[:id])
  redirect '/member-offers' unless current_user.id == @offer.profile_id
  erb :update_offer
end

put '/member-offers/:id' do
  offer = MemberOffer.find(params[:id])
  offer.offer_title = params[:offer_title]
  offer.offer = params[:offer]
  offer.your_name = params[:your_name]
  offer.email = params[:email]
  offer.phone = params[:phone]
  offer.image = params[:image]
  offer.save
  redirect "/member-offers/#{params[:id]}"
end

delete '/member-offers/:id' do
  offer = MemberOffer.find(params[:id])
  offer.delete
  redirect '/member-offers'
end

get '/members' do
  @users = Profile.all
  erb :members
end

get '/member-benefits' do
  erb :member_benefits
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
