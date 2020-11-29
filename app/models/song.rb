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
  
  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
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
      note.content ? notes << note.content : nil
    end
    notes
  end 
  
end
