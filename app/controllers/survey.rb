get "/:id/survey" do |id|
  @current_user = User.find(id)
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


