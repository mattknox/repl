DEFAULT_STARTING_SELF = self
REPL_CONTEXT_STACK = [binding]

module Repl
  def repl
    DEFAULT_STARTING_SELF.cb binding
    REPL_CONTEXT_STACK.push(binding)
  end
  
  def stop_repl
    REPL_CONTEXT_STACK.pop if (self == REPL_CONTEXT_STACK.last)
    DEFAULT_STARTING_SELF.cb( REPL_CONTEXT_STACK.empty? ? DEFAULT_STARTING_SELF : REPL_CONTEXT_STACK.pop )
  end
end

module HookRepl  # FIXME: not everything unterstands class_eval.  Maybe need an "eval in this thing method?"
  def self.replize_object(obj, class_or_instance_or_both = :both)
    obj.class_eval "extend Repl" if [:class, :both].member?(class_or_instance_or_both)
    obj.class_eval "include Repl" if [:object, :both].member?(class_or_instance_or_both)
  end
end
