module Players
  class Computer < Player

    def move(board, num)

      if num==1
        method1(board)
      elsif num==2
        method2(board)
      else
        method0(board)
      end

    end

    def method0(board)
      puts "Method 0"             #random
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
      "6"
      elsif board.cells[7] == " "
        "8"
      end
    end 

    def method1(board)
      puts "Method 1"           #middle then triangle strategy
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.isTaken(5) && board.isTaken(1) && board.cells[8] == " "
        "9"
      elsif board.isTaken(5) && board.isTaken(1) && board.isTaken(9) && board.cells[2] == " "
        "3"
      elsif board.isTaken(5) && board.isTaken(1) && board.isTaken(9) && board.isTaken(3) && board.cells[1] == " "
        "2"
      elsif board.isTaken(5) && board.isTaken(1) && board.isTaken(9) && board.cells[6] == " "
        "7"
      elsif board.isTaken(5) && board.isTaken(1) && board.isTaken(9) && board.isTaken(7) && board.cells[3] == " "
        "4"
      elsif board.isTaken(1) && board.cells[2] == " "
        "3"
      elsif board.isTaken(1) && board.isTaken(3) && board.cells[1] == " "
        "2"
      elsif board.cells[7] == " "
        "8"
      elsif board.cells[5] == " "
        "6"
      end
    end

    def method2(board)
      puts "Method 2"         #
      if board.cells[4] == " "
        "5"
      elsif board.cells[3] == " "
        "4"
      elsif board.isTaken(5) && board.isTaken(4) && board.cells[5] == " "
        "6"
      elsif board.isTaken(5) && board.isTaken(4) && board.cells[7] == " "
        "8"
      elsif board.isTaken(5) && board.isTaken(4) && board.isTaken(8) && board.cells[1] == " "
        "2"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[0] == " "
        "1"
      end
    end
  end
end