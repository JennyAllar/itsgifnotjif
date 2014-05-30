class Gif < ActiveRecord::Base
  def self.search(search)
    result = []
    result << Gif.find_by(:name => search)
    #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    result
  end
end