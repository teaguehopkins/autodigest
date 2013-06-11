class Article < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :author, :link, :summary, :title

  before_save :set_data

  private

  	def set_data
  		api= Embedly::API.new :key => '1c6012863bac4e67bba0c2b62e591fbe'
  		obj = api.oembed :url => self.link
  		#obj[0].thumbnail_url
  		self.title = obj[0].title
  		self.summary = obj[0].description
  		self.author = obj[0].author_name
  	end
end
