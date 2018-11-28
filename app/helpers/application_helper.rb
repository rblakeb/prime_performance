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
      options = {
      filter_html:     false,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      quote:              true, 
      highlight:          true,
      strikethrough:      true,
      underline:          true,
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      image:              false
    }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(content).html_safe

      # options = {
      #   autolink: true,
      #   strikethrough: true,
      #   underline: true,
      #   linebreak: true,
      #   quote: true,
      #   highlight: true,
      #   blockquote: true
      # }   
      Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
