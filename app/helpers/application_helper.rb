module ApplicationHelper
  def title(text)
    content_for :title, text
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

  def tag_cloud(tags)
    max = tags.max_by(&:count)
    tags.each do |tag|
      # index = tag.count.to_f / max.count * (classes.size - 1)
      # yield(tag, classes[index.round])
      tag.name
    end
  end

  def markdown(content)
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
      options = {
        autolink: true,
        strikethrough: true,
        underline: true,
        linebreak: true
      }   
      Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
