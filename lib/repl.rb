REPL_CONTEXT_STACK = []
DEFAULT_STARTING_SELF = self
REPL_LAST_UP = false

module Repl
  def repl
    REPL_LAST_UP = true
    DEFAULT_STARTING_SELF.cb self
    REPL_CONTEXT_STACK.push(self)
  end
  
  def stop_repl
    REPL_CONTEXT_STACK.pop if REPL_LAST_UP
    REPL_LAST_UP = false
    DEFAULT_STARTING_SELF.cb ( REPL_CONTEXT_STACK.empty? ? DEFAULT_STARTING_SELF : REPL_CONTEXT_STACK.pop )
  end
end

module HookRepl
  def self.replize_object(obj, class_or_instance_or_both = :both)
    obj.class_eval "extend Repl" if [:class, :both].member?(class_or_instance_or_both)
    obj.class_eval "include Repl" if [:object, :both].member?(class_or_instance_or_both)
  end
end
