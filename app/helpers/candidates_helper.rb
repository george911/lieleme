module CandidatesHelper
  def touch_within_14_days(title,city)
    if MailHistory.where("created_at > ?", Time.now.days_ago(14)).where("title like ? and city like ?",title,city).present? 
      return "#e58c7e"
    else
      return "#FFF"
    end
  end
end

