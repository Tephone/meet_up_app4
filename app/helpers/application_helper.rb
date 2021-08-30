module ApplicationHelper
  def ja(language_name)
    t("language.#{language_name}")
  end

  def languages_option
    Language.all.map { |language| [ja(language.name), language.id] }
  end

  def today
    Date.current
  end

  def dates_in_this_month
    (today.beginning_of_month..today.end_of_month).to_a
  end

  def weeks_in_this_month
    dates_in_this_month.slice_before {|date| date.wday.zero?}.to_a
  end

  def days_of_week
    %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日].freeze
  end

  def reservation_rate(lessons)
    teacher_lessons = lessons
    reserved_teacher_lessons = teacher_lessons.reserved
    if teacher_lessons.count.zero?
      '--'
    else
      reservation_rate = reserved_teacher_lessons.count / teacher_lessons.count.to_f * 100
      reservation_rate.to_i
    end
  end
end
