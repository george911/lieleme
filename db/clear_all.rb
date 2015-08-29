module ClearAll
  puts 'in clear_all'
  Email.delete_all
  Relationship.delete_all
  Boss.delete_all
  Education.delete_all
  Experience.delete_all
  Job.delete_all
  LineItem.delete_all
  Rate.delete_all
  Review.delete_all
  Subordinate.delete_all
  Summary.delete_all
  User.delete_all
  Work.delete_all
  Comment.delete_all
  Invitation.delete_all
  Interview.delete_all
  Micropost.delete_all
  SavingList.delete_all
  TalentPool.delete_all
  JobRate.delete_all
  ServiceRate.delete_all 
end

