class SiteGenerator
  attr_reader :path

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
    FileUtils.mkdir_p "#{path}/artists"
    FileUtils.mkdir_p "#{path}/genres"
    FileUtils.mkdir_p "#{path}/songs"
  end

def generate_index(template_path)
#  HEREDOC
# First load the template string
template_string = File.read("./lib/views/#{template_path}.erb")
# Instantiate the ERB template instance
template = ERB.new(template_string)
html = template.result

File.write("#{path}/#{template_path}", html)
end

def call
  generate_index("index.html")
  generate_index("artists/index.html")
  generate_index("genres/index.html")
  generate_index("songs/index.html")
end

end

#template generates what is inside of there^^^
#index will read the view
#generate a template
#compile the template
#then write it

#the content of the file in def generate_index
