class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  # GET /groups.json

  def index
    @groups = Group.all

    render json: @tables
  end

  # POST /tables
  # POST /tables.json

  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json

  def update
    if @group.update(group_params)
      head :no_content
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json

  def delete
    @group.destroy

    head :no_content
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :retardment, :time_limit)
    end

end
