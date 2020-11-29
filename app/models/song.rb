class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 
  
  def artist_name
    self.artist ? self.artist.name : nil
  end 
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 
  
  def genre_name
    self.genre ? self.genre.name : nil
  end 
  
  def notes_content=(content)
    notes_content.each do |content|
      self.notes << Notes.find_or_create_by(content: content)
    end
  end 
  
  def notes_content
    notes = []
      self.notes.each do |note|
        
  end 
  
end
