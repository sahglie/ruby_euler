ONES = {
  1  => "one",  2  => "two",  3  => "three",
  4  => "four", 5  => "five", 6  => "six",
  7  => "seven", 8  => "eight", 9  => "nine",
}

TENS = {
  1 => "ten", 2 => "twenty", 3 => "thirty", 4 => "forty",
  5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty",
  9 => "ninety"
}

def thousands?(n)
  n.length > 3 && n.length < 7
end

def hundreds?(n)
  n.length < 4 && n.length > 2
end

def tens?(n)
  n.length < 3 && n.length > 1
end

def ones?(n)
  n.length == 1
end

def parse_thousands(n)
  n[/(\d+)(\d{3})$/]

  a = case $1.length
      when 1 then parse_ones($1)
      when 2 then parse_tens($1)
      when 3 then parse_hundreds($1)                
      end
  
  b = parse_hundreds($2)
  a + " thousand " + b
end

def parse_hundreds(n)
  if n[0] == "0"
    parse_tens(n[1, 2])
  else
    "#{ONES[n[0].to_i]} hundred " + parse_tens(n[1, 2])
  end
end

def parse_tens(n)
  if n[0] == "0"
    parse_ones(n[1])
  elsif n[0] == "1"
    case n
    when "10" then "ten"
    when "11" then "eleven"
    when "12" then "twelve"
    when "13" then "thirteen"
    when "14" then "fourteen"
    when "15" then "fifteen"
    when "16" then "sixteen"
    when "17" then "seventeen"
    when "18" then "eighteen"
    when "19" then "nineteen"
    end
  else
    2.upto(9) do |i|
      if i.to_s == n[0]
        digit = ONES[n[1].to_i]
        ones = digit.nil? ? "" : "-#{digit}"
        return "#{TENS[i]}" + ones
      end
    end
  end
end

def parse_ones(n)
  "#{ONES[n[0].to_i]}"
end

def parse_num(n, str = "")
  if thousands?(n)
    str << parse_thousands(n)
  elsif hundreds?(n)
    str << parse_hundreds(n)
  elsif tens?(n)
    str << parse_tens(n)
  elsif ones?(n)
    str << parse_ones(n)
  else
    raise "Parsing error"
  end

  parts = str.split(" ")
  if parts.length > 2
    last = parts.pop
    parts.push("and")
    parts.push(last)
  end
  parts.join(" ")          
end



if $0 == __FILE__
  len = 0
  1.upto(1000) do |num|
    str = parse_num(num.to_s)
    len += str.gsub(/\s|-/, "").length
  end
  puts len
end
