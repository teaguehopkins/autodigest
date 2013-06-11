class Article < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :author, :link, :summary, :title

  before_save :set_data

  private

  	def set_data
  		api= Embedly::API.new :key => '1c6012863bac4e67bba0c2b62e591fbe'
  		obj = api.oembed :url => self.link
  		#puts obj[0].title, obj[0].description, obj[0].thumbnail_url
  		#@extracted_article = http://api.embed.ly/1/extract?key=:key&url=:url&format=:format
  		#@extracted_article = http://api.embed.ly/1/extract?key=1c6012863bac4e67bba0c2b62e591fbe&url=www.teaguehopkins.com&format=json
  		#agent=Mechanize.new # Creates a new Mechanize Object
		#agent.get(self.link) # This fetches the page given as parameter
   		#self.title = agent.page.title # This will return the title of the page
  		self.title = obj[0].title
  		self.summary= obj[0].description
  	end
end
