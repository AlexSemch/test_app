authorization do
  #Гость
  role :guest do
    has_permission_on :users, :to => [:new, :create]

  end

  #Студент
  role :student do
    has_permission_on :users, :to => [:new, :create]
    has_permission_on :users, :to => [:edit, :update, :show] do
      if_attribute :id => is { user.id}
  end
    has_permission_on [:dteors, :dthems, :dtests],  :to => [:index, :show]
    has_permission_on [:dquestions, :danswers], :to => [:show]


  end

  #Вчитель
  role :teacher do
    includes :student
    has_permission_on [:dteors, :dthems, :dtests],  :to => [:new, :create, :edit, :update, :destroy]
    has_permission_on [:dquestions, :danswers], :to => [:index,  :new, :create, :edit, :update, :destroy]
  end

  #Адміністратор
  role :admin do
    includes :teacher
    has_permission_on :users, :to => [:index,  :new, :create, :edit, :update, :destroy]
    has_permission_on :microposts, :to => [:index,  :new, :create, :edit, :update, :destroy, :show]

  end
    
end