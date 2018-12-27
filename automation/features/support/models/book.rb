class Book
  attr_accessor :title, :author, :rank

  def to_hash
    {title: title,
     author: author,
     rank: rank
    }
  end

end