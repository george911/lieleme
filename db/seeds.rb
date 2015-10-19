# 老的seed文件在backup里
#require File.expand_path('get_talents', __FILE__)
Candidate.where("title == ? and location == ?","PHP","Shenzhen").each do |f|
	f.destroy
end
