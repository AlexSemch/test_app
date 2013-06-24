module JtestsHelper


  def calculate_ball(jtest)
    @jquestions = Jquestion.where(jtest_id: jtest.id)
    ball = 0

    @jquestions.each do |jquest|
      if pranswer?(jquest.id)
        ball+=1
      end
    end

    #Винести настройки бальної системи та оцінювання в глобальні налаштування
    return (ball * 12) /((Dtest.find(jtest.dtest_id)).count_test)

  end

  def pranswer?(jquest_id)
    ans = true
    janswers = Janswer.where(jquestion_id: jquest_id)
    janswers.each do |a|
      if !(a.truanswer == (Danswer.find(a.danswer_id)).ans_is_true)
        ans =  false
      end
    end
    return ans
  end

end
