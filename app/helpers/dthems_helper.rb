module DthemsHelper

  def get_tem
    if current_user.admin or current_user.rol == 'teacher'
      Dthem.order(:them_text)
    elsif current_user.student
      Dthem.where(:class_st => current_user.student.class_st).order(:them_text)
    else
      nil
    end
  end

end
