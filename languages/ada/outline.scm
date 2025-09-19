; subprograms
(generic_instantiation name: (_) @name) @item
(subprogram_body [
    (function_specification name: (_) @name)
    (procedure_specification name: (_) @name)
    ]) @item
(subprogram_declaration [
    (function_specification name: (_) @name)
    (procedure_specification name: (_) @name)
    ]) @item
(subprogram_renaming_declaration [
    (function_specification name: (_) @name)
    (procedure_specification name: (_) @name)
    ]) @item
(null_procedure_declaration (procedure_specification name: (_) @name)) @item
(expression_function_declaration
    (function_specification name: (_) @name)) @item
(entry_declaration . (identifier) @name) @item
(entry_body (identifier) @name) @item

; packages
(package_body name: (_) @name) @item
(package_declaration name: (_) @name) @item

; types
(full_type_declaration . (identifier) @name) @item
(subtype_declaration . (identifier) @name) @item

; objects
(object_declaration name: (_) @name) @item
(extended_return_object_declaration . (identifier) @name) @item
