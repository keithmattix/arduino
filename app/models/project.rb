class Project
  include Mongoid::Document
  before_create :create_slug
  field :name, type: String
  field :description, type: String
  field :x_name, type: String
  field :y_name, type: String
  field :data, type: Array
  field :slug, type: String
  belongs_to :user

  def to_param
    slug
  end

  def create_slug
    self.slug = self.name.parameterize
  end
end
