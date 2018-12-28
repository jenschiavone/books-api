class Book
  attr_accessor :title, :author, :rank, :list_name_encoded

  def to_hash
    {title: title,
     author: author,
     rank: rank,
     list_name_encoded: list_name_encoded
    }
  end

end