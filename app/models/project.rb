class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  before_create :create_slug
  field :name, type: String
  field :description, type: String
  field :x_name, type: String
  field :y_name, type: String
  field :slug, type: String
  belongs_to :user
  has_many :data_values, dependent: :destroy

  after_update do |document|
    
  end

  def to_param
    slug
  end

  def create_slug
    self.slug = self.name.parameterize
  end
end
