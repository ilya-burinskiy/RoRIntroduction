class Admin::BadgesController < Admin::BaseController
  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit
    @badge = find_badge
  end

  def update
    @badge = find_badge
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    badge = find_badge
    badge.destroy
    redirect_to admin_tests_path
  end

  def show
    @badge = find_badge
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :url, :rule, :rule_property)
  end

  def find_badge
    Badge.find(params[:id])
  end
end
