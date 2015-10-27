module UsersHelper

  #returns a globally recognized avatar based on email
  def gravatar_for(user)
    #lowercase before MD5 hash
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #fetch from resource
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.fullname, class:'gravatar')
  end
end
