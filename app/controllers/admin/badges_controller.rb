class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy]
  
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    new_params = nil

    case params.require(:badge)[:rule]
    when "passing_test_on_first_try"
      new_params = params.require(:badge).merge({ rule_property: params.require(:badge)[:test_id] })
    when "passing_all_tests_from_category"
      new_params = params.require(:badge).merge({ rule_property: params[:badge][:category_id] })
    when "passing_all_tests_by_level"
      new_params = params.require(:badge).merge({ rule_property: params[:badge][:level] })
    end

    new_params = new_params.except(:test_id, :category_id, :level).permit(:name, :url, :rule, :rule_property)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
