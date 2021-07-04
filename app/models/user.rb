class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  has_many :followers,class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy #, inverse_of: :follower
  has_many :followeds, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy #, inverse_of: :following

  # 次の2行を追記
  has_many :followed_users, through: :followers, source: :followed # followersを通じてfollowingにたどり着く
  has_many :follower_users, through: :followeds, source: :follower # followingsを通じてfollowerにたどり着く


  # フォローする
  def follow(other_user_id)
    followers.create(followed_id: other_user_id)
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user_id)
    followers.find_by(followed_id: other_user_id).destroy
  end

  # フォローしているか確認
  def following?(other_user)
    followed_users.include?(other_user)
  end



  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end