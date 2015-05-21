class HashDontCare
  def initialize
    @h = {}
  end

  def []=(k, v)
    @h[symbolize_key!(k)] = v
  end
  alias_method :store, :[]=

  def [](k)
    @h[symbolize_key!(k)]
  end

  def key?(k)
    @h.key?(symbolize_key!(k))
  end
  alias_method :has_key?, :key?
  alias_method :include?, :key?
  alias_method :member?, :key?

  def keys
    @h.keys
  end

  private

  def symbolize_key!(k)
    k.is_a?(String) ? k.to_sym : k
  end
end
