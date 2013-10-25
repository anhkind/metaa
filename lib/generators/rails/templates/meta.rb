<%- module_namespacing do -%>
<%- if parent_class_name.present? -%>
class <%= class_name %>Meta < <%= parent_class_name %>
  <%- else -%>
class <%= class_name %>
  <%- end -%>

  # Define the meta tag of your object here. You can use a Hash to define your meta, for example:
  #
  #   meta name:    "title",
  #        content: ->(object){ object.title } # you can also use lambda or proc

end
<% end -%>