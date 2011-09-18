module ApplicationHelper

  def error_messages_for(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = "Warning! Invalid fields..."
    #sentence = I18n.t("errors.messages.not_saved",
    #                  :count => resource.errors.count,
    #                  :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h3>#{sentence}</h3>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def respond_to_resource(resource)
    respond_to do |format|
      format.html
      format.json { render json: resource }
      format.xml { render xml: resource }
    end
  end
end
