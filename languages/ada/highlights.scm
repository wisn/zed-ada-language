; keywords (ada 2022 reserved keywords)
[
    "abort"
    "else"
    "null"
    "select"
    "abs"
    "elsif"
    "of"
    "separate"
    "abstract"
    "end"
    "or"
    "some"
    "accept"
    "entry"
    "others"
    "subtype"
    "access"
    "exception"
    "out"
    "synchronized"
    "aliased"
    "exit"
    "overriding"
    "tagged"
    "all"
    "for"
    "package"
    "task"
    "and"
    "function"
    "pragma"
    "terminate"
    "array"
    "generic"
    "private"
    "then"
    "at"
    "goto"
    "procedure"
    "type"
    "begin"
    "if"
    "protected"
    "until"
    "body"
    "in"
    "raise"
    "use"
    "case"
    "interface"
    "range"
    "when"
    "constant"
    "is"
    "record"
    "while"
    "declare"
    "limited"
    "rem"
    "with"
    "delay"
    "loop"
    "renames"
    "xor"
    "delta"
    "mod"
    "requeue"
    "digits"
    "new"
    "return"
    "do"
    "not"
    "reverse"
] @keyword

; comments
(comment) @comment

; literals
(string_literal) @string
(character_literal) @string
(numeric_literal) @number
((identifier) @boolean (#match? @boolean "^[Tt][Rr][Uu][Ee]$"))
((identifier) @boolean (#match? @boolean "^[Ff][Aa][Ll][Ss][Ee]$"))

; operators
[
    (relational_operator)
    (binary_adding_operator)
    (unary_adding_operator)
    (multiplying_operator)
    (tick)
] @keyword.operator

; type definition
(full_type_declaration (identifier) @type.interface)
(access_to_object_definition (identifier) @type)
(subtype_declaration (identifier) @type)

; enums
(enumeration_type_definition (identifier) @enum)
(discrete_choice (expression (term (identifier) @enum)))
(discrete_choice (identifier) @type (_))

; arrays
(array_type_definition (component_definition (identifier) @type))
(array_type_definition (index_subtype_definition (identifier) @type))
(object_declaration (identifier) @variable (identifier) @type (index_constraint (identifier) @type))
(slice (identifier) @type)
(range_g (identifier) @type)

; generics
(formal_object_declaration (identifier)+ (identifier) @type)
(formal_object_declaration ((_) . (identifier)) @variable)
(formal_complete_type_declaration (identifier) @type)
(formal_incomplete_type_declaration (identifier) @type)
(formal_package_declaration (identifier) @title)
(formal_derived_type_definition (identifier) @type)

; pragmas
(pragma_g (identifier) @emphasis)
(pragma_argument_association (expression (term (identifier) @type)))

; subprograms
(parameter_specification (identifier)+ (identifier) @type)
(parameter_specification ((_) . (identifier)) @variable.parameter)
(parameter_specification (access_definition (identifier) @type))
(aspect_association ((identifier) @type.super))
(generic_instantiation name: (_) @function)
(entry_declaration . (identifier) @function)
(result_profile (identifier) @type.super)
(result_profile (access_definition (identifier) @type.super))
(subprogram_body (_)* (identifier) @function)
(subprogram_body (_)* (string_literal) @function)
(subprogram_renaming_declaration (_)* (identifier) @type.super)
(relation_membership (membership_choice_list (term (identifier) @type)))
(parameter_association (expression (term (selected_component (identifier) @type))))

; functions
(function_specification name: (_) @function)
(function_call name: (_) @function)

; procedures
(procedure_specification name: (_) @function)
(procedure_call_statement name: (_) @function)

; packages
(package_declaration name: (_) @title)
(package_declaration (_)* (identifier) @title)
(package_body name: (_) @title)
(package_body (_)* (identifier) @title)
(package_body (_)* (selected_component (identifier) @title))
(subunit (identifier) @title)
(private_type_declaration (identifier) @type)
(private_extension_declaration (identifier) @type)
(incomplete_type_declaration (identifier) @type)
(discriminant_specification (_)* (identifier) @type)
(discriminant_specification ((_) . (identifier)) @variable)
(package_body_stub (identifier) @title)
(protected_body_stub (identifier) @type)
(task_body_stub (identifier) @type)

; assignments
(assignment_statement . (identifier) @variable)
(allocator subtype_mark: (identifier) @type)
(allocator (qualified_expression subtype_name: (identifier) @type))
(allocator (selected_component prefix: (identifier) @type))
(object_declaration (identifier)+ (identifier) @type)
(object_declaration ((_) . (identifier)) @variable)

; attributes
(attribute_designator (identifier) @property)
((range_attribute_designator (_)*) @property)
((range_attribute_designator ("(" . (_) . ")" @primary) @primary))
(reduction_attribute_designator (identifier) @property)

; imports
(with_clause (_) @label)
(use_clause (_) @label)

; exceptions
(raise_expression (identifier) @type)
(exception_declaration . (identifier) @type)

; preprocessor
(gnatprep_declarative_if_statement) @preproc
(gnatprep_if_statement) @preproc
(gnatprep_identifier) @preproc

; protected objects
(single_protected_declaration (identifier) @type)
(protected_definition (_)* (identifier) @type)
(protected_definition (entry_declaration (_) (identifier) @type))
(protected_definition (component_declaration (identifier) @variable))
(protected_definition (component_declaration (component_definition (identifier) @type)))
(protected_body (identifier) @type)
(abort_statement (identifier) @type)
(protected_body (entry_body (identifier) @function))
(requeue_statement (identifier) @type)
(entry_index_specification (identifier)+ (identifier) @type)

; records
(component_list (component_declaration (identifier) @variable))
(component_list (component_declaration (component_definition (_) @type)))
(interface_type_definition (identifier) @type)
(derived_type_definition (identifier) @type)

; renames
(object_renaming_declaration (identifier) @type)
(exception_renaming_declaration (identifier) @type)
(package_renaming_declaration (identifier) @title)
(package_renaming_declaration (selected_component (identifier) @label))
(generic_renaming_declaration (identifier) @type)

; statements
(target_name) @emphasis.strong
(iterator_specification (_) (identifier) @type)
(extended_return_object_declaration (identifier) @variable)
(extended_return_object_declaration (identifier) (identifier) @type)
(loop_label (identifier) @constant)
(exit_statement (identifier) @constant)
(loop_statement (_)* (identifier) @constant)
(goto_statement (identifier) @constant)
(label (identifier) @constant)
(loop_parameter_specification (range_g (selected_component (identifier) @type)))

; exceptions
(exception_handler (exception_choice_list (exception_choice (identifier) @type)))
(raise_statement (identifier) @type)

; takss
(single_task_declaration (identifier) @variant)
(task_definition (_)* (identifier) @variant)
(task_body (_)* (identifier) @variant)
(accept_statement (identifier) @variant)
(task_type_declaration (identifier) @variant)
