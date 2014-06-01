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
end