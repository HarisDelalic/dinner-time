require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resources_url
    assert_response :success
  end

  test "should get show" do
    get resource_url(resources(:flour))
    assert_response :success
  end

  test "should post create" do
    post resources_url, params: { resource: { name: 'test', unit_of_measurement: resources(:flour).unit_of_measurement, quantity: resources(:flour).quantity } }
    assert_redirected_to resources_url
  end

  test "should not create if exist with same name" do
    name = 'duplicate name'
    2.times do
      post resources_url, params: { resource: { name: name, unit_of_measurement: resources(:flour).unit_of_measurement, quantity: resources(:flour).quantity } }
    end
    assert_response :unprocessable_entity
  end

  test "should put update" do
    put resource_url(resources(:flour)), params: { resource: { name: resources(:flour).name, unit_of_measurement: resources(:flour).unit_of_measurement, quantity: resources(:flour).quantity } }
    assert_redirected_to resource_url(resources(:flour))
  end

  test "should delete destroy" do
    delete resource_url(resources(:flour))
    assert_redirected_to resources_url
  end

end
