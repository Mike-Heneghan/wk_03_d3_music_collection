class Album
  attr_reader :id, :title, 

  def initialize(options)
    @id = options['id']
    @name = options['name']
  end

  def save()

    sql = "
    INSERT INTO albums

    ;
    "

  end

end
