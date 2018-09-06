require 'time'


module GreenBox
  class DateRange
    attr_reader :start_date , :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date

      if start_date > end_date
        raise ArgumentError.new "The end date is before the start date"
      end
    end

    def contains(date)
      if (date >= start_date) && (date < end_date)
        return true
      else
        date < start_date || date >= end_date
        return false
      end
    end


    def overlaps(other_date_range)
      if contains(other_date_range.start_date) || contains(other_date_range.end_date)
        true
      elsif other_date_range.contains(start_date) && other_date_range.contains(end_date)
        true
      else
        false
      end
    end


    def nights
      count = (end_date - start_date)/(60*60*24)
      return count
    end

  end
end
