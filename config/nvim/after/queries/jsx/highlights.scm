(jsx_element
  open_tag: (jsx_opening_element
    attribute: (jsx_attribute
    (property_identifier) @jsx.prop)))

(jsx_self_closing_element
  attribute: (jsx_attribute
    (property_identifier) @jsx.prop))

(jsx_opening_element ((identifier) @jsx.element
 (#match? @jsx.element "^[A-Z]")))

(jsx_closing_element ((identifier) @jsx.close.element
 (#match? @jsx.close.element "^[A-Z]")))

(jsx_self_closing_element ((identifier) @jsx.element
 (#match? @jsx.element "^[A-Z]")))

; Handle the dot operator effectively - <My.Component>
(jsx_opening_element ((nested_identifier (identifier) @jsx.element (identifier) @jsx.close.element)))

; Handle the dot operator effectively - </My.Component>
(jsx_closing_element ((nested_identifier (identifier) @jsx.close.element (identifier) @jsx.close.element)))

; Handle the dot operator effectively - <My.Component />
(jsx_self_closing_element ((nested_identifier (identifier) @jsx.element (identifier) @jsx.element)))

; import/require keywords and names
((identifier) @namespace (#eq? @namespace "require"))
(namespace_import (identifier) @none)
[
"import"
"from"
"as"
] @namespace

(call_expression function: (identifier) @function.call)
(call_expression function: (member_expression property: (property_identifier) @function.call))

; Highlight React Hook usage
(call_expression function: (identifier) @reactHook (#match? @reactHook "^use[A-Z]"))

(class_declaration name: (identifier) @className)

; Disable constants on import statements
(import_statement (import_clause (identifier)) @none)

(object (pair key: (property_identifier) @object.pair.key))
(pair_pattern key: (property_identifier) @object.pair.key)
