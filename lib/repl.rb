CONTEXT_STACK = []
DEFAULT_STARTING_SELF = self

module Repl
  def repl
    DEFAULT_STARTING_SELF.cb self
    CONTEXT_STACK.push(self)
  end
  
  def stop_repl
    DEFAULT_STARTING_SELF.cb CONTEXT_STACK.pop
  end
end

module HookRepl
  def self.replize_object(obj, class_or_instance_or_both = :both)
    obj.class_eval "extend Repl" if [:class, :both].member?(class_or_instance_or_both)
    obj.class_eval "include Repl" if [:object, :both].member?(class_or_instance_or_both)
  end
end
