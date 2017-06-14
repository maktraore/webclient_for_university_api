class Webclient1Controller < ApplicationController
  URL = "http://localhost:3001/api/universities"
  HEADER = {"accept" => "application/json",
                            "authorization" => "Token token=#{ENV['API_KEY']}",
                            "X-User-Email" => ENV["seyba@gmail.com"]
                          }
  def index
    @universities = University.all
    render :index
  end
  def show
   @university = University.find_by(id: params[:id])
  end
  def new
    render :new
  end
  def create
    university = Unirest.post("http://localhost:3001/api/universities/#{params[:id]}.json", headers: {"accept" => "application/json"},
      parameters: {name: params[:name]}).body
    redirect_to "universities/#{university["id"]}"
  end
  def edit
    @university = University.find_by(id: params[:id])
    # @university = Unirest.get("http://localhost:3001/api/universities/#{params[:id]}.json").body
  end 
  def update

    university =  University.find_by(id: params[:id])
    university.update(
          id: params[:id],
          name:  params[:name]
      )

    # Unirest.patch("http://localhost:3001/api/universities/#{params[:id]}.json", headers: HEADER,
    #   parameters: {name: params[:name]}).body
    redirect_to "/webclient"
  end
  def destroy
    university = University.find_by(id: params[:id])
    university.destroy(
      id: params[:id], 
      name: params[:name])

    redirect_to "/webclient"

  end
end
