get "/:id/survey" do
  erb :'survey/title_form'
end

post "/:id/survey/new" do |id|# User creates a new survey.
  @new_survey = Survey.create(title: params['new_survey']['title'], user_id: id)
  redirect("#{id}/survey/#{@new_survey.id}/edit")
end

get "/:user_id/survey/:survey_id/edit" do |user_id, survey_id|
  @survey = Survey.find(survey_id)
  erb :'survey/edit'
end

post '/:user_id/survey/:survey_id/edit' do |user_id, survey_id|
  @survey = Survey.find(survey_id)
  @created_question = Question.create(description: params['question'])
  @survey.questions << @created_question
  i = 1
  4.times do
    @created_question.answers << Answer.create(description: params["#{i}"])
    i += 1
  end
  erb :'survey/edit'
end

get '/share/:survey_id' do |survey_id|
  @survey = Survey.find(survey_id)
  erb :'survey/share_page'
end

#Route sent to share. Will allow you to either take your survey, or view stats
get '/survey/:id' do |id|
  @survey = Survey.find(id)

  if current_user
    (stat_array = (@survey.user_id == current_user.id) ? @survey.questions.map { |q| q.find_stat } : nil)
  end

  erb :'survey/take_survey', locals: {stat_array: stat_array}
end

get '/survey/:id/submit' do |id|
  # create selection record
  params.each do |key, answer_id|
    next if !(key.match("response"))
    UserAnswer.create(answer_id: answer_id.to_i)
  end

  # get stats
  @survey = Survey.find(id)
  stat_array = @survey.questions.map {|q| q.find_stat}
  erb :'survey/take_survey', locals: {stat_array: stat_array, questions: @survey.questions}
end
