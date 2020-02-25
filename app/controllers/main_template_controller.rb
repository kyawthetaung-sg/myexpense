class MainTemplateController < ApplicationController
    include Pagy::Backend
    
    prepend_before_action :set_locale

    private

    def set_locale
        if current_user
            if current_user.language == 2
                I18n.locale = 'ja'
            else
                I18n.locale = 'en'
            end
        end
    end
end
