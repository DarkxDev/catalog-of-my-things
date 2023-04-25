require_relative './item'

class MusicAlbum < Item
  def initialize(genre, author, source, label, publish_date, on_spotify: true)
    super(id, genre, author, source, label, publish_date, archived)
    @id = id
    @on_spotify = on_spotify
    @archived = archived
  end

  def can_be_archived?()
    if super && on_spotify
      true
    else
      false
    end
  end
  
end