require 'test_helper'

class ComentariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

<<<<<<< HEAD
  test "should get show" do
    get :show
    assert_response :success
  end

=======
>>>>>>> 2c05d65856763c0beb1797f8206b8c873954ccdb
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
