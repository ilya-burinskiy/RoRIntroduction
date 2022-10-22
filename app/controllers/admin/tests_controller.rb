class Admin::TestsController < Admin::BaseController
  def index
    @tests = load_tests
  end

  def show
    @test = find_test
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = current_user

    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    test = find_test
    test.destroy
    redirect_to admin_tests_path
  end

  def edit
    @test = find_test
  end

  def update
    @test = find_test
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    test = find_test
    if test.update(test_params)
      redirect_to admin_tests_path
    else
      @tests = load_tests
      render :index
    end
  end

  def start
    test = find_test
    current_user.started_tests.push(test)
    redirect_to current_user.test_passage(test)
  end

  private

  def find_test
    Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :time, :category_id)
  end

  def load_tests
    Test.all
  end
end
