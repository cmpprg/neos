class NeosTable

  def self.create_list(neos_object)
    divider(neos_object)
    header(neos_object)
    create_rows(neos_object)
    divider(neos_object)
  end

  def self.column_labels
    { name: "Name:",

      diameter: "Diameter:",
      miss_distance: "Missed The Earth By:" }
  end

  def self.column_info(neos)
    column_labels.reduce({}) do |measurements, (attribute, label)|
      measurements[attribute] = {
        label: label,
        width: [neos.max_character_length_of(attribute),label.length].max
        }
      measurements
    end
  end

  def self.divider(neos)
    divider = column_info(neos).map do |_,column|
      "-"*column[:width]
    end.join('-+-')

    puts "+-#{divider}-+"
  end

  def self.header(neos)
    header = column_info(neos).map do |_,column|
      column[:label].ljust(column[:width])
    end.join(' | ')

    puts "| #{header} |"
  end


  def self.create_rows(neos)
      neos.collection.each { |neo| format_row_data(neo, column_info(neos)) }
  end

  def self.format_row_data(neo, column_info)
    row = column_info.keys.map do |key|
      neo.send("#{key}").ljust(column_info[key][:width])
    end.join(' | ')

    puts "| #{row} |"
  end

end
