class Candidate < ActiveRecord::Base
  scope :unique_title, -> {where("email like ? or email like ? or email like ? or email like ? or email like ? or email like ? or email like ? or email like ? or email like ? or email like ? or email like ?","cvsend@139.com","twotrees.zf@gmail.com","imganquan@gmail.com","zlp1166@126.com","ji.asi@hotmail.com","azure.m.jiang@newegg.com","scuwzf@gmail.com","the.warl0ck.1989@gmail.com","kjxin988@qq.com","chenggui53@foxmail.com","nl.martian@gmail.com")}
  belongs_to :user
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|model| [model.email,model.title] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end
end
