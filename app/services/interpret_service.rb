class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "create"
      FaqModule::CreateService.new(params).call()
    when "remove"
      FaqModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    when "translate"
      response = TranslateService.new(params)
      result = response.translate
    else
      "Não compreendi o seu desejo"
    end
  end
end