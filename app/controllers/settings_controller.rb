class SettingsController < MainTemplateController
  before_action :set_user, only: [:edit_language, :update_language, :update_theme]
  
  def index
    @title = t("menu_title.setting.title")
  end

  def edit_language
    @title = t("menu_title.setting.edit_language")
    @languages = {"英語 (English)" => 1, "日本語 (Japanese)" => 2}
  end

  def update_language
    @user.update(user_params)
    redirect_to settings_path
  end

  def update_theme
    @user.update(:theme_id => params[:id])
    redirect_to themes_path
  end

  private

    def set_user
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:language)
    end
end
