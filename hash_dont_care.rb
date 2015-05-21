class HashDontCare < Hash
  def []=(k, v)
    super symbolize_key!(k), v
  end
  alias_method :store, :[]=

  def [](k)
    super symbolize_key!(k)
  end

  def key?(k)
    super symbolize_key!(k)
  end
  alias_method :has_key?, :key?
  alias_method :include?, :key?
  alias_method :member?, :key?

  private

  def symbolize_key!(k)
    k.is_a?(String) ? k.to_sym : k
  end
end
