class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      resp.write "#{Item.price}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    if req.path.match(/songs/)
 
      song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    end
    
    resp.finish
  end 
end 