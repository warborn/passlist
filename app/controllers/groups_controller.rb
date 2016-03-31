class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  # GET /groups.json

  def index
    @groups = Group.all

    render json: @groups
  end

  def show
    render json: {
      "group": serialize(@group),
      "classes": serialize(@group.classes)
    }
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
      render json: @group, status: 200, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json

  def destroy
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

    def serialize(object)
      if object.is_a?(Array)
        object.map do |item|
          ActiveModel::SerializableResource.new(item)
        end
      else
        ActiveModel::SerializableResource.new(object)
      end
    end

end
