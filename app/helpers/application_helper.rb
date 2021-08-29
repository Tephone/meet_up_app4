module ApplicationHelper
  def ja(language_name)
    t("language.#{language_name}")
  end

  def languages_option
    Language.all.map { |language| [ja(language.name), language.id] }
  end
end
