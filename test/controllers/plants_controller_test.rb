require 'test_helper'

class PlantsControllerTest < ActionController::TestCase
  setup do
    @plant = plants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plants)
  end

  test "should create plant" do
    assert_difference('Plant.count') do
      post :create, plant: { description: @plant.description, name: @plant.name, scientific_name: @plant.scientific_name }
    end

    assert_response 201
  end

  test "should show plant" do
    get :show, id: @plant
    assert_response :success
  end

  test "should update plant" do
    put :update, id: @plant, plant: { description: @plant.description, name: @plant.name, scientific_name: @plant.scientific_name }
    assert_response 204
  end

  test "should destroy plant" do
    assert_difference('Plant.count', -1) do
      delete :destroy, id: @plant
    end

    assert_response 204
  end
end
