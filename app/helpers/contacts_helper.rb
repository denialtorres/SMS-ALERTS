module ContactsHelper
  def input_error(errors)
    if errors.any?
      content_tag(:span, "* #{errors.first}", class: "error")
    end
  end

  def errors_message(errors)
    unique_errors = errors.keys.count

    "El formulario contiene #{pluralize(unique_errors, 'error')}, por favor " \
    "#{'corrígelo'.pluralize(unique_errors)} e intenta de nuevo."
  end
end
