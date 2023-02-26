;; extends

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

(call method: (identifier) @rspec.test.macro (#match? @rspec.test.macro "^(describe)$"))

; (
;  call
;  block: (_ (call method: (identifier) @rspec.test.macro (#match? @rspec.test.macro "^(context|it|let)")))
;  )

(call method: (identifier) @rspec.test.macro (#match? @rspec.test.macro "^(context|it|let)"))

(call method: (identifier) @rspec.before.and.after (#match? @rspec.before.and.after "^(before|after|around)$"))

; (call receiver: (constant) @Rspec block: (_) (#match? @Rspec "^(RSpec)$"))

(call receiver: (constant) @rspec (#match? @rspec "^(RSpec)$") (set! "definition.var.scope" "local"))

(call block: (do_block ["do" "end"] @rspec.keyword))

; Something is wrong with this one
; (call block: (do_block (call block: (do_block ["do" "end"] @rspec.keyword))))

; (call method: (identifier) @rspec.methods (#match? @rspec.methods "^(subject|subject!|example)$"))

(
 call
 block: (_ (call method: (identifier) @rspec.keyword (#match? @rspec.keyword "^(subject|subject!|example)")))
 )

 (call method: (identifier) @rspec.keyword (#match? @rspec.keyword "^(subject|subject!|example)"))

; (
;  call
;  block: (_ (call receiver: (identifier) @rspec.matchers(#match? @rspec.matchers "^(is_expected|be_empty)")))
;  )

 (
 call
 block: (_ (call receiver: (call method: (identifier) @rspec.matchers (#match? @rspec.matchers "^(expect|eq|be_empty|have_http_status)"))))
 )
(call method: (identifier) @rspec.matchers (#match? @rspec.matchers "^(eq|be_empty|have_http_status)$"))
(call arguments: (_ (identifier) @rspec.matchers (#match? @rspec.matchers "^(be_empty)$")))
(call receiver: (scope_resolution scope: (identifier) @rspec.matchers (#match? @rspec.matchers "^(described_class)$")))
(call receiver: (identifier) @rspec.matchers (#match? @rspec.matchers "^(expect|described_class|is_expected|be_empty|be_valid)$"))
(call receiver: (call method: (identifier) @rspec.matchers (#match? @rspec.matchers "^(expect|described_class|is_expected|be_empty|be_valid)$")))
