# 老的seed文件在backup里
#require File.expand_path('../get_talents', __FILE__)
Candidate.where("title LIKE ? and city Like ?","Python","Shanghai").each do |f|
	f.destory
end
#require File.expand_path('../clear_all', __FILE__)
