class AdminsController < ApplicationController
    before_action :authenticate_admin!
    def index
        render json: {
            admins: Admin.all
        }
    end

    def show
    end
end
