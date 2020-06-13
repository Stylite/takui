require "kemal"
require "json"
require "totem"

module Takui

  conf = Totem.from_file "config.yaml"
  fp = conf.get("fp")
  key = conf.get("key")
  host_url = conf.get("url")

  get "/" do |env|
    env.response.content_type = "application/json"
    {"hello": "This is Takui, a crystal based image hosting service. Contact links: https://discord.gg/HZP7fUs Github links: https://github.com/Stylite/takui/"}.to_json
  end
  
  get "/:file" do |env|
    name = env.params.url["file"]
    send_file env, "#{fp}#{name}"
  end

  # Make sure to fill in Authorization key here 
  post "/upload" do |env|
    new_filename = "default"
    env.response.content_type = "application/json"
    if env.request.headers["Authorization"] != "#{key}"
      resp = {"error": "not authorized"}.to_json
      halt env, status_code: 403, response: resp
    else 
      HTTP::FormData.parse(env.request) do |upload|
        filename = upload.filename
      # Be sure to check if file.filename is not empty otherwise it'll raise a compile time error
        if !filename.is_a?(String)
          resp = {"error": "Y'all forgot an image??"}.to_json
          halt env, status_code: 403, response: resp
        else
          file_extention = filename.split(".")
          new_filename = Random::Secure.urlsafe_base64(6) + "." + file_extention[1]
          file_path = ::File.join [Dir.current + "/images", new_filename]
          File.open(file_path, "w") do |f| 
            IO.copy(upload.body, f)
          end
        end
    end 
    end
    {"url": "#{host_url}/#{new_filename}"}.to_json
  end
  
  
  Kemal.run
end
