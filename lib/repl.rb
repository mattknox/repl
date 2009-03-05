DEFAULT_STARTING_SELF    = self
DEFAULT_STARTING_BINDING = binding
REPL_CONTEXT_STACK = []

module Repl
  def repl
    DEFAULT_STARTING_SELF.cb self
    REPL_CONTEXT_STACK.push(binding)
  end
  
  def stop_repl
    REPL_CONTEXT_STACK.pop if (self == REPL_CONTEXT_STACK.last)
    DEFAULT_STARTING_SELF.cb((REPL_CONTEXT_STACK.pop or DEFAULT_STARTING_BINDING  ))
  end
end

module HookRepl  # FIXME: not everything unterstands class_eval.  Maybe need an "'eval in this thing' method?"
  def self.replize_object(obj, class_or_instance_or_both = :both)
    obj.class_eval "extend Repl" if [:class, :both].member?(class_or_instance_or_both)
    obj.class_eval "include Repl" if [:object, :both].member?(class_or_instance_or_both)
  end
end
