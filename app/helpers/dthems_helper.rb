module DthemsHelper

  def get_tem
    if current_user.admin or current_user.rol == 'teacher'
      Dthem.order(:class_st)
    elsif current_user.student
      Dthem.where(:class_st => current_user.student.class_st).order(:class_st)
    else
      nil
    end
  end

end
