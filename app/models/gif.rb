class Gif < ActiveRecord::Base
  def self.search(search)
    Gif.where(<<SQL
  name  ilike '%#{search}%'
  or
  keyword_1 ilike '%#{search}%'
  or
  keyword_2 ilike '%#{search}%'
  or
  keyword_3 ilike '%#{search}%'
SQL
    ).all
    #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  end
  
  belongs_to :user
  
  #favorites
  has_many :favorite_gifs
  has_many :favorited_by, through: :favorite_gifs, source: :user

end