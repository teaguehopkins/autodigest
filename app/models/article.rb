class Article < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :author, :link, :summary, :title, :thumbnail_url

  before_save :set_data

  private

  	def set_data
  		api= Embedly::API.new :key => '1c6012863bac4e67bba0c2b62e591fbe'
  		obj = api.oembed :url => self.link
      @url = obj[0].url
      if @url==nil
        @url=self.link
      end
  		if @url.include? '?'
        self.link = @url.slice(0..(@url.index('?')-1))
      else
        self.link = @url
      end
      if self.title==""
        self.title = obj[0].title
      end
      if self.summary==""
  		  self.summary = obj[0].description
      end
  		if self.author==""
        self.author = obj[0].author_name
      end
      if self.thumbnail_url==""
        self.thumbnail_url = obj[0].thumbnail_url
      end  	
    end
end
