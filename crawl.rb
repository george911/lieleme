desc "获取ruby-china.org上的工作"
    task :get_jobs => :environment do
      time_start     = Time.now
      Job.connection
      (1..74).each do |_id|
        url = "https://ruby-china.org/jobs?page=#{_id}"
        doc = Nokogiri::HTML(open(url))
        doc.xpath("//div[@class='topics']/div").each do |_line|
          topic_class     = _line['class']
          right_info_path = "//div[@class='#{topic_class}']/div[@class='right-info']"
          topic_path      = right_info_path +"/div[@class='pull-right replies']/a"
          # 获取点赞数量
          up =  doc.xpath(topic_path).text
          up =  0 if up.empty?

          # 获取标题
          title_path      = right_info_path + "/div[@class='infos']/div[@class='title']/a"
          title           = doc.xpath(title_path)[0]['title']

          # 获取url
          url_suffix      = doc.xpath(title_path)[0]['href']
          url             = "https://ruby-china.org/#{url_suffix}"
          area            = cal_area(title)
          job             = Job.create!(title: title, area: area, up: up, url: url)

          puts "#{title}"
        end
      end

      time_end   = Time.now
      puts "rake 执行完毕！耗时#{ time_end - time_start }秒"
    end