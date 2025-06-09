class DesprePage < Fae::StaticPage

  @slug = 'despre'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      description: { type: Fae::TextArea },
      images: { type: Fae::TextArea },
      parteneri_media_intro: { type: Fae::TextField},
      parteneri_media_content: { type: Fae::TextArea},
      merch_display_text: { type: Fae::TextField}
    }
  end

end
