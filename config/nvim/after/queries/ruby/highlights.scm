
(call method: (identifier) @none)

; disable highlight on method calls and not let from Rspec
(module name: (constant) @ruby.module)

(call method: (identifier) @ruby.macro (#match? @ruby.macro "^(delegate)$"))
(call method: (identifier) @ruby.accessor (#match? @ruby.accessor "^(attr_reader|attr_writter|attr_accessor)"))

(instance_variable) @instance_variable
(do_block parameters: (block_parameters (identifier) @block.parameters))

; (call method: (identifier) @sorbet.signature (#match? @sorbet.signature "^sig"))
(call method: (identifier) @sorbet.signature (#match? @sorbet.signature "^(sig|params|void|return)"))
(call method: (identifier) @extends (#match? @extends "^(extend)$"))
(call method: (identifier) @extends (#match? @extends "^(include)$") arguments: (argument_list) @arguments (#match? @arguments "[A-Z]") )

(call method: (identifier) @ruby.entity (#match? @ruby.entity "^(validates|validates_with|has_one|has_many|scope|belongs_to)$"))

(if ["end"] @conditional)

; (method ["end"] @ruby.method.end)

[
"return"
] @ruby.return

[
"&"
"||="
] @operator

(call method: (identifier) @rails.callback (#match? @rails.callback "^(before_action)$"))

(call method: (identifier) @rails.response (#match? @rails.response "^(render)$"))

(call method: (identifier) @ruby.include (#match? @ruby.include "^(require)$"))

(call method: (identifier) @rspec.group.methods (#match? @rspec.group.methods "^(describe)$"))

(
 call
 block: (_ (call method: (identifier) @rspec.group.methods (#match? @rspec.group.methods "^(context|it|let)")))
 )

(call method: (identifier) @rspec.before.and.after (#match? @rspec.before.and.after "^(before|after|around)$"))

; (call receiver: (constant) @Rspec block: (_) (#match? @Rspec "^(RSpec)$"))

(call receiver: (constant) @rspec (#match? @rspec "^(RSpec)$") (set! "definition.var.scope" "local"))

(call block: (do_block ["do" "end"] @rspec.keyword))
(call block: (do_block (call block: (do_block ["do" "end"] @rspec.keyword))))

(
 call
 block: (_ (call method: (identifier) @rspec.keyword (#match? @rspec.keyword "^(subject|subject!|example)")))
 )

 (
 call
 block: (_ (call receiver: (call method: (identifier) @rspec.matchers (#match? @rspec.matchers "^(expect|eq|be_empty|have_http_status)"))))
 )
(call method: (identifier) @rspec.matchers (#match? @rspec.matchers "^(eq|be_empty|have_http_status)$"))
(call arguments: (_ (identifier) @rspec.matchers (#match? @rspec.matchers "^(be_empty)$")))
(call receiver: (scope_resolution scope: (identifier) @rspec.matchers (#match? @rspec.matchers "^(described_class)$")))
(call receiver: (identifier) @rspec.matchers (#match? @rspec.matchers "^(described_class)$"))
