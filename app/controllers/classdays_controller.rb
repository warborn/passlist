class ClassdaysController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_classday, only: [:update, :destroy]

  # GET /groups/:group_id/classdays
  # GET /groups/:group_id/classdays.json

  def index
    @classdays = Classday.all

    render json: @classdays
  end

  # POST /groups/:group_id/classdays
  # POST /groups/:group_id/classdays.json

  def create
    @group = Group.find(params[:group_id])
    @classday = @group.classdays.build(classday_params)

    if @classday.save
      render json: @classday, status: :created, location: group_classdays_url(@classday)
    else
      render json: @classday.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/:group_id/classdays/:id
  # PATCH/PUT /groups/:group_id/classdays/:id.json

  def update
    if @classday.update(classday_params)
      render json: @classday, status: 200, location: group_classdays_url(@classday)
    else
      render json: @classday.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/:group_id/classdays/:id
  # DELETE /groups/:group_id/classdays/:id.json

  def destroy
    @classday.destroy

    head :no_content
  end

  private

    def set_classday
      @classday = Classday.find(params[:id])
    end

    def classday_params
      params.require(:classday).permit(:day, :begin_time, :end_time)
    end

end
