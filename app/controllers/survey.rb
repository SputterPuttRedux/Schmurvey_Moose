get "/:id/survey" do |id|
  @current_user = User.find(id)
  erb :'survey/title_form'
end

post "/:id/survey/new" do |id|# User creates a new survey.
  @new_survey = Survey.create(title: params['new_survey']['title'], user_id: id)
  redirect("#{id}/survey/#{@new_survey.id}/edit")
end

get "/:user_id/survey/:survey_id/edit" do |user_id, survey_id|

end
