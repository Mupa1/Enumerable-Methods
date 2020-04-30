module Enumerable
  def my_each
    return to_enum unless block_given?

    i = 0
    while i < size
      yield(to_a[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    my_each do |item|
      yield(item, i)
      i += 1
    end
  end

  def my_select
    return to_enum unless block_given?

    selected = []
    my_each do |item|
      selected.push(item) if yield(item)
    end
    selected
  end

  # rubocop:disable Style/CaseEquality
  def my_all?(arg = nil)
    case
    when block_given?
      my_each { |i| return false unless yield(i) }
    when arg.nil?
      my_each { |i| return false unless i }
    else
      my_each { |i| return false unless arg === i }
    end
    true
  end

  def my_any?(arg = nil)
    case
    when block_given?
      my_each { |i| return true if yield(i) }
    when arg.nil?
      my_each { |i| return true if i }
    else
      my_each { |i| return true if arg === i }
    end
    false
  end

  def my_none?(arg = nil)
    case
    when block_given?
      my_each { |i| return false if yield(i) }
    when arg.nil?
      my_each { |i| return false if i }
    else
      my_each { |i| return false if arg === i }
    end
    true
  end

  def my_count(arg = nil)
    count = 0
    my_each do |item|
      if !arg.nil?
        count += 1 if arg === item
      elsif block_given?
        count += 1 if yield(item)
      else
        count = length
      end
    end
    count
  end
  # rubocop:enable Style/CaseEquality

  def my_map
    return to_enum unless block_given?

    mapped = []
    my_each do |item|
      mapped.push(yield(item))
    end
    mapped
  end
end
