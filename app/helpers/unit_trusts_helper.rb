module UnitTrustsHelper
  def self.deposit_time_badge(time)
    case time
    when 0
      '<span class="badge badge-soft-success">Inmediato</span>'
    when 1..24
      "<span class=\"badge badge-soft-info\">#{time} horas</span>"
    when 25..48
      "<span class=\"badge badge-soft-warning\">#{time} horas</span>"
    else
      "<span class=\"badge badge-soft-danger\">#{time} horas</span>"
    end
  end
end
