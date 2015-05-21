class HashDontCare < Hash
  def initialize(argument= {})
    if argument.is_a? Hash
      super
    end
  end

  def to_hash
    map do |k,v|
      { k => symbolize_key!(v)}
    end.reduce :merge
  end

  def []=(k, v)
    super symbolize_key!(k), v
  end
  alias_method :store, :[]=

  def [](k)
    super symbolize_key!(k)
  end

  private

  def symbolize_key!(k)
    k.is_a?(String) ? k.to_sym : k
  end
end
