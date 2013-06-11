class Article < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :author, :link, :summary, :title

  before_save :set_title

  private

  	def set_title
  		@key="1c6012863bac4e67bba0c2b62e591fbe"
  		#@extracted_article = http://api.embed.ly/1/extract?key=:key&url=:url&format=:format
  		#@extracted_article = http://api.embed.ly/1/extract?key=1c6012863bac4e67bba0c2b62e591fbe&url=www.teaguehopkins.com&format=json
  		self.title = "Default Title"
  		#self.title = @extracted_article.title
  	end
end
