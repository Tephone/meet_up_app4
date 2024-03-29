module ApplicationHelper
  def i18n_language_name(language_name)
    t("language.#{language_name}")
  end

  def languages_option
    Language.all.map { |language| [i18n_language_name(language.name), language.id] }
  end

  def tickets_option
    Ticket.where(fee: [2200, 5500, 8250]).map { |ticket| ["#{ticket.fee}円 レッスン可能数: #{ticket.lesson_count}", ticket.id] }.sort_by { |lesson_count, _| lesson_count }
  end

  def monthly_plans_option
    MonthlyPlan.pluck(:name, :id).sort_by{ |_, id| id }
  end

  def dates_in_this_month
    Date.current.all_month.to_a
  end

  def weeks_in_this_month
    dates_in_this_month.slice_before { |date| date.wday.zero? }.to_a
  end

  def days_of_week
    %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日].freeze
  end

  def time_range
    (7..22).to_a
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
