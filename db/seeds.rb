# 本地和服务器数据库不要互相导入,candidates存在本地，jobs存在服务器，本地保存邮件发送记录不能被覆盖
# 老的seed文件在backup里
# require File.expand_path('../get_talents', __FILE__)
#	f.destroy
#end
#require File.expand_path('../clear_all', __FILE__)
#Candidate.dedupe
#Candidate.gen_mail_summary
Job.all.each do |f|
  f.destroy
end

