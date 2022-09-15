class ScoreController < ApplicationController
  skip_before_action :verify_authenticity_token
  def list
    @stu_all = Student.all
    @max_name = ""
    @max_s = 0.0
    @sum = 0.0
    for e in @stu_all do
      if @max_s < e.score
        @max_s = e.score
        @max_name = e.name
      end
      @sum += e.score
    end
  
  end

  def edit
    if(params[:isRoot] == 'true')
      @id = params[:id]
      @name = Student.find(@id).name
      @score = Student.find(@id).score
    else
      @id = params[:id]
      @x = Student.find(@id)
      @x.name = params[:name]
      @x.score = params[:score].to_f
      @x.save!
      redirect_to controller: 'score', action: 'list'
    end
  end


  def delete
    Student.destroy_by(id: params[:id])
    redirect_to controller: 'score', action: 'list'
  end
end
