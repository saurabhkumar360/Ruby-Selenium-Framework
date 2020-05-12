
class ConfigFileReader

  @file = File.read('Configuration/configuration.json')
  @data_hash = JSON.parse(@file)

  def self.get_url()
    @url = @data_hash['homePageUrl']
    return @url
  end

  def self.get_user_name()
    @email = @data_hash['userName']
    return @email
  end

  def self.get_password()
    @password = @data_hash['password']
    return  @password
  end

end