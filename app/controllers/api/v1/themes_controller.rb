class Api::V1::ThemesController < ApplicationController
    def index
        @themes = Theme.all
        render json: {status: 'success', data: @themes}
    end
end