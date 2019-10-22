class NumLetterCombination

  def initialize
    @result  = []
  end


  $NUM_MAPPING = {
    "2"=>"ABC",
    "3"=>"DEF",
    "4"=>"GHI",
    "5"=>"JKL",
    "6"=>"MNO",
    "7"=>"PQRS",
    "8"=>"TUV",
    "9"=>"WXYZ",
    "1"=>"1",
    "0"=>"0",
  }


  @@dist = ["MOTOR","MOTORTRUCK","TRUCK","MOTOR","USUAL","NOUN","STRUCK","NOT","OPT","PUCK","CAT","ACTA","CONTOUR","BOOT","OUR","ACT","AMOUNT","AMOUNTS","MOUNTS"]

  def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    /\A[+-]?\d+(\.[\d]+)?\z/.match obj
  end


  def get_number
    puts "Enter a number:"

    phone_number = gets.chomp
    unless  number?(phone_number)
      puts "OOPS!! it's is not a number, please enter a number"
      return
    end
    get_all_char(phone_number)
  end



  def get_all_char(phone_number)
    letter_arr = []
    num_arr = phone_number.split("")

    num_arr.each do |i_num|
      letter_arr <<   $NUM_MAPPING[i_num].split("")
    end
    letter_arr.flatten!
    new_letter_arr = letter_arr.select{|letter| letter != "1" && letter != "0"}
    new_letter_arr.uniq!
    (3..new_letter_arr.length).each do |i_index|
      permutate(new_letter_arr, "", new_letter_arr.size, i_index )
    end
  end



  def permutate(str, prefix, n, k)
    if (k == 0)
      if @@dist.include?prefix
        @result <<  prefix
        p prefix
        @@dist.delete(prefix)
      end
      return
    end
    for i in 0...n
      newPrefix = prefix + str[i].to_s

      permutate(str, newPrefix, n, k-1);

    end
  end

end


num = NumLetterCombination.new

num.get_number
