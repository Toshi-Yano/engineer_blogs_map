module ApplicationHelper
  def default_meta_tags
    {
      site: Settings.site.name,
      title: Settings.site.title,
      description: Settings.site.description,
      canonical: request.original_url,
      og: {
        title: Settings.site.title,
        type: Settings.site.meta.ogp.type,
        url: request.original_url,
        image: Settings.site.meta.ogp.image_path,
        site_name: Settings.site.name,
        description: :description,
        locale: 'ja_JP'
      }
    }
  end
end
