class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :age, :admin, :long_comments_count

  has_many :comments

  def admin
    object.admin? ? "YES" : "NO"
  end

  def long_comments_count
    object.comments.select { |c| c.content.length > 255 }.count
  end
end
