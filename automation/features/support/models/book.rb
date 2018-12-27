class Book
  attr_accessor :title

  def to_hash
    {title: title}
  end

end