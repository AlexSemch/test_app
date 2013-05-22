class StudentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, only: :destroy

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      flash[:success] = t(:student_save)
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.paginate(page: params[:page])
    @top_student = Student.find_by_sql("select *
      from students
      where round_ball is not null
      order by round_ball DESC, count_of_test DESC
      limit :M", N: 10)

  end

  def destroy
    Student.find(params[:id]).destroy
    if Student.find(params[:id]).destroyed?
      flash[:success] = t(:student_destroy)
      redirect_to students_path
    else
      flash[:error] = t(:ups)
      redirect_to students_path
    end
   #  if Student.find(params[:id]).nil?
    #   flash.alert = t(:ups!)
    #  redirect_to root_path
    #else
    #  Student.find(params[:id]).destroy
    #  flash[:success] = t(:student_destroy)
    #  redirect_to students_path
    #end
  end

  def top_ten
     @top_student = Student.find_by_sql("select *
      from students
      where round_ball is not null
      order by round_ball DESC, count_of_test DESC
      limit :M", N: 10)
  end

  def edit
      @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      flash[:success] = t(:update)
      redirect_to @student
    else
      render 'edit'
    end
  end

    # PUT метод (привязати акаун до студента)
  def add_to_user
    @student = Student.find(params[:student_id])
    #@student = current_user.create_student(params[:student])
    current_user.student = (@student)
    flash[:success] = t(:save)
    redirect_to students_path
  end


   # PUT метод (відписати акаунт від учня)
  def remote_from_user
    @student = Student.find(params[:student_id])
    @student.user_id = nil
    if @student.save
       flash[:saccess] = "successfull remote_from_user"

     end 
     redirect_to students_path
  end


  helper_method :add_to_user

end
