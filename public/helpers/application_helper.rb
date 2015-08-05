module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def hidden_span_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag(:span, attributes, &block)
  end
  
  def hidden_tr_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag(:tr, attributes, &block)
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new #建立新的summaries等
    id = new_object.object_id #提取id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  def remove_unwanted_words string
    bad_words=["上海","南京","北京","广州","year","years","about","one","days","less","over","more"," a ","than","minute","hour","month","months","day","days","second","s"," "]
    bad_words.each do |f|
    string.gsub!(f,'')
    end
    return string.present? ? string: "0"
  end

  def age(birthday)
    age=remove_unwanted_words distance_of_time_in_words(Date.today,birthday) unless birthday == nil
    return age
  end

 def resource_name
    :user
 end

 def resource
   @resource ||= User.new
 end

 def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
 end

end
