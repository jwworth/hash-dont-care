class HashDontCare < Hash
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
