module UsersHelper
  def user_find_job_assist(user)
    user.find_job_assist ? t('i_want_to_find_job_assist') : t('i_do_not_want_to_find_job_assist')
  end

  def user_tab_attrs(name)
    target = params.fetch('target', 'all')
    if target == name
      'active'
    else
      ''
    end
  end
end
