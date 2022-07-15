module Sluggable
  extend ActiveSupport::Concern

  included do
    def get_slug
      simple_slug = self.name.gsub(/[^A-Za-z0-9 ]/, '').gsub(/\s+/, '-')
      slug_count = self.class.all.select{|rec| rec.slug.start_with?(simple_slug)}.length
      # TODO: expand this to account for deleted records
      if slug_count > 0
        return "#{simple-slug}-#{slug_count}"
      else
        return simple_slug
      end
    end

    def image=(_image)
      self.image.attach(_image)
      self.image_url = url_for(self.image)
    end
  end
end
