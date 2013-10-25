<%- module_namespacing do -%>
<%- if parent_class_name.present? -%>
class <%= class_name %>Meta < <%= parent_class_name %>
  <%- else -%>
class <%= class_name %>
  <%- end -%>
  def define_meta
    # Define meta tags of your record here. Each definition will require a hash for the meta attributes,
    #  and each attribute can be a string, symbol or lambda/proc, for example:
    # meta name:    "title",
    #      content: object.title # you can access to the model through 'object' method

  end
end
<% end -%>