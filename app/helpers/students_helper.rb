module StudentsHelper

  def gravatar_for_student(student, options = { size: 50})
    user = User.find(student.user_id)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.nik, class: "gravatar")
  end

end
