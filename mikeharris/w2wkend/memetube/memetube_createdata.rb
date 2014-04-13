
require 'pg'
require 'pry'
#create memtube data base (createdb memetube)
#run: psql -d memetube -f memetube.sql 
#run:  memetube_createdata.rb

db = PG.connect(:dbname =>'memetube', :host => 'localhost')

data =  [{"id"=>"7",
  "title"=>"Afv",
  "description"=>"Clips from americas funniest home videos.",
  "url"=>"ArfNdxmEiPo",
  "genre"=>"Comedy"},
 {"id"=>"22",
  "title"=>"Afv",
  "description"=>"Americas funniest home videos.",
  "url"=>"Hyz2ZeoR7Ak",
  "genre"=>"Comedy"},
 {"id"=>"13",
  "title"=>"Bananman",
  "description"=>"Banana faced man in a cartoon.",
  "url"=>"qwRMYz1vfcQ",
  "genre"=>"Action"},
 {"id"=>"20",
  "title"=>"Kim vs kourtnery",
  "description"=>
   "Pop-up YOLO pug, tote bag typewriter Etsy twee chambray sriracha.", 
  "url"=>"nIikTvwu9Dw",
  "genre"=>"Comedy"},
 {"id"=>"21",
  "title"=>"Ruby on rails",
  "description"=>"Ruby tutorial",
  "url"=>"UQ8_VOGj5H8",
  "genre"=>"Education"},
 {"id"=>"12",
  "title"=>"Sausage",
  "description"=>"Cooking a sausage in a pan. How to do it.",
  "url"=>"cd7jxT__39A",
  "genre"=>"Cooking "},
 {"id"=>"14",
  "title"=>"Spiderman",
  "description"=>"superhero saves the town and gets the girl.",
  "url"=>"OmaI1nInDOs",
  "genre"=>"Action"},
 {"id"=>"10",
  "title"=>"Swingers",
  "description"=>"Youre so money baby and you dont even know it...",
  "url"=>"B9IpC2v6r2Y",
  "genre"=>"Comedy"},
 {"id"=>"18",
  "title"=>"The tempest",
  "description"=>"Shipwreck - much drama beffalls everyone",
  "url"=>"jXoNHs3WOgM",
  "genre"=>"Shipwreck"},
 {"id"=>"15",
  "title"=>"True grit",
  "description"=>"2010 version of classic film",
  "url"=>"vXCmUEaPQPM",
  "genre"=>"Drama"},
 {"id"=>"16",
  "title"=>"True romance",
  "description"=>"Shooter. Quentin tarantino written.",
  "url"=>"CHmcQCTKr58",
  "genre"=>"Shooter"},
 {"id"=>"19",
  "title"=>"Yellowsubmarine",
  "description"=>"Beatles classic music video",
  "url"=>"3jmdLpsK_k8",
  "genre"=>"Music"}]

  data.each do |entry|
    
      sql = "insert into videos (title, description, url, genre) values('#{entry["title"]}', '#{entry["description"]}', '#{entry["url"]}', '#{entry["genre"]}')"
      db.exec(sql)
  end

