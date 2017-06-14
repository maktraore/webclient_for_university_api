class University
  attr_accessor :id, :name
  HEADER = {"accept" => "application/json",
                            "authorization" => "Token token=seyba",
                            "X-User-Email" => "seyba@gmail.com"
                          }
  def initialize(hash)
    @id =  hash["id"]
    @name = hash["university_name"]
  end
  def self.all
     api_universities = Unirest.get("http://localhost:3001/api/universities.json", headers: HEADER).body
    universities = []
    api_universities.each do |univ|
        universities<< University.new(univ)
      end
      universities
  end
  def self.find_by(symbol)
    id = symbol[:id]
     hash = Unirest.get("http://localhost:3001/api/universities/#{id}.json", headers: HEADER).body
    University.new(hash)
  end
  def update(hash)
    id = hash[:id]
    university = Unirest.patch("http://localhost:3001/api/universities/#{id}.json", headers: HEADER,
      parameters: {name: hash[:name]}).body
  end
  def destroy(hash)
    id = hash[:id]
    university = Unirest.delete("http://localhost:3001/api/universities/#{id}.json").body
  
  end
end