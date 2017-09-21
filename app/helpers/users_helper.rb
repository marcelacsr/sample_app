module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar img-circle')
  end

  def avatar_for(user, options = {size: 80})
    if user.avatar.url.empty?
      gravatar_for(user)
    else

      image_tag user.avatar.url(:thumb), class: 'gravatar img-circle',
                #modificar thumb para passar uma imagem maior para exibir no perfil quando chamar avatar_for
                style: "width:#{options[:size]}px;height:#{options[:size]}px"
    end
  end

end

