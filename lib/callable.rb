module Callable
  def call(*args, &block)
    new(*args).call(&block)
  end
end
