class UserBooksSpider < Kimurai::Base
  @name = 'user_books_spider'
  @engine = :mechanize
  @@author = nil
  @@categoryid = nil
  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def self.get_author
    @@author
  end

  def self.get_category_id
    @@categoryid
  end

  def parse(response, url:, data: {})
    #response.xpath("//div[@class='g rhsvw kno-kp mnr-c g-blk']").each do |element|
    item = {}
    category = {}
    item[:name]      = response.xpath("//div[@class='i4J0ge']//div[@class='mod']")[3].css('span.LrzXr a')&.text&.squish.downcase
    item[:bio]       = response.xpath("//div[@class='i4J0ge']//div[@class='mod']")[3].css('span.LrzXr a').first["href"]
    item[:name] = "Others" if item[:name].blank?
    value=""
    response.xpath("//div[@class='mod']").each do|element|
      value=value+element
      value.concat(" ")
      if(value.start_with?("Genre:"))
        value = value[6...value.length].strip
        break
      else
        value=""
      end
    end
    category[:name]=value
    @@author = Author.find_by(name:item[:name])
    @@author = Author.create(item) if @@author.nil?
    @@categoryid = Category.find_or_create_by(category).id
  end

  
end
#//*[@id="rhs"]/div/div[1]/div[1]/div[1]/div/div[5]/div/div[4]
#//*[@id="rhs"]/div/div[1]/div[1]/div[1]/div/div[5]/div/div[5]
#//*[@id="srp-listing-rows-container"]/div[4]
