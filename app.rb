require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:square_new_cal)
end

get("/square/results") do
  @the_num = params.fetch("number").to_f

  @the_result = @the_num**2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_cal)
end

get("/square_root/results") do
  @the_num = params.fetch("number").to_f

  @the_result = @the_num**(0.5)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_cal)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @apr_result = @apr.to_fs(:percentage, precision: 4)
  @r_pv = @apr/100/12

  @years = params.fetch("user_years").to_i
  @montly = @years*12

  @pv = params.fetch("user_pv").to_f
  @pv_result = @pv.to_fs(:currency)

  @num = @r_pv*@pv
  @den = 1-(1+@r_pv)**(-@montly)

  @result = (@num/@den).to_fs(:currency)
  
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_cal)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random_result = rand(@min..@max)

  erb(:random_results)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
