class Article < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :author, :link, :summary, :title

  before_save :set_title

  private

  	def set_title
  		#@api= Embedly::API.new
  		#@extracted_article = api.oembed :url => self.link
  		#@key="1c6012863bac4e67bba0c2b62e591fbe"
  		#@extracted_article = http://api.embed.ly/1/extract?key=:key&url=:url&format=:format
  		#@extracted_article = http://api.embed.ly/1/extract?key=1c6012863bac4e67bba0c2b62e591fbe&url=www.teaguehopkins.com&format=json
  		agent=Mechanize.new # Creates a new Mechanize Object
agent.get(self.link) # This fetches the page given as parameter
 # This will return the title of the page
  		self.title = agent.page.title
  		#self.title = @extracted_article.title
  	end
end
