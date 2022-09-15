class MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  $global_num = 0
  $name = []
  $score = []

  def home
    @num = [1,2,3,4,5,6,7,8,9,10]
  end

  def test
    if params[:num] == ""
      redirect_to controller: 'main', action: 'home'
    else
      $name = []
      $score = []
      @n = params[:num].to_i
      $global_num = @n
      @check = []
      @root = params[:isRoot]
      nextp = true
      for i in 1..@n do
        if params["sub#{i}"] == "" or params["scr#{i}"] == ""
          nextp = false
          @check = @check.append(false)
        else
          @check = @check.append(true)
        end
        $name.append(params["sub#{i}"])
        $score.append(params["scr#{i}"].to_f)
      end
      if(@root == 'false')
        if(nextp)
          redirect_to controller: 'main', action: 'out'
        end
      end
    end
  end

  def out
    @max_sub = "none"
    @max_all = 0.0
    @sum = 0.0
    for i in 1..$global_num do
      student = Student.new
      student.name = $name[i-1]
      student.score = $score[i-1]
      student.save
      @sum += $score[i-1]
      if(@max_all < $score[i-1])
        @max_all = $score[i-1]
        @max_sub = $name[i-1]
      end
    end
  end
end
