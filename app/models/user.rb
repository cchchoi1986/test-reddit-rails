class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # a user has many posts
  has_many :posts

  # a user has many comments
  has_many :comments

  has_many :post_votes

  # uploading avatar
  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # uploading resume
  has_attached_file :resume,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['ACCESS_KEY_ID'], :secret_access_key => ENV['SECRET_ACCESS_KEY']}
  end
end
