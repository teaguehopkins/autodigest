class Article < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :author, :link, :summary, :title
end
