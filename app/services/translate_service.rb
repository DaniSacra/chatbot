require 'json'
require 'rest-client'
require 'sinatra'

class TranslateService 

  def initialize params
    @url = "https://translate.yandex.net/api/v1.5/tr.json/translate"
    @key = "trnsl.1.1.20200109T234456Z.8d3dff6472b60726.c215849260fc7f27c9afad7ff2e9ddc28852637d" 
    @text = params["text"]
    # @text = "Love"
    (params[:lang])? @lang = params[:lang].downcase : @lang="pt"
  end

  def translate
    request = "#{@url}?key=#{@key}&text=#{@text}&lang=#{get_yandex_lang_code}"

    resp = RestClient.get request

    phrase = JSON.parse(resp.body)["text"][0]
  end


  private

    def get_yandex_lang_code
      case @lang
      when "ingles"
        "en"
      when "italiano"
        "it"
      when "espanhol"
        "es"
      when "frances"
        "fr"
      when "alemao"
        "de"
      else
        "pt"
      end
    end
end