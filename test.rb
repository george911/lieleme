require 'rubygems'
require 'nokogiri'
require 'open-uri'
["Java"].each do |language|
  ["shanghai","beijing","shenzhen","guangzhou","Hangzhou","chengdu","nanjing","xiamen","wuhan","hongkong","taiwan","tianjin","macau","Hefei","Fuzhou","Dongguan","Guilin","Harbin","Suzhou","Wuxi","Qingdao","chongqin"].each do |location|
    (1..100).each do |_id|
      url = "https://github.com/search?l=#{language}&p=#{_id}&q=language%3A#{language}+location%3A#{location}&ref=advsearch&type=Users&utf8=%E2%9C%93"
      doc = Nokogiri::HTML(open(url))
      doc.css(".user-list-info").each do |item|
        # Email.create(name: item.css("a").first.text,email:item.css("a").last.text)
	printf("%-20s%-13s%-35s%-15s%s\n",item.css("a").first.text,"#{language}",item.css("a").last.text,item.css(".join-date").text,item.css("span").first.text)
      end
      sleep 5
    end
  end
end
