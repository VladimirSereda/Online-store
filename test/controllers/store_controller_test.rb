require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select '#colums #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.prece', /\$[,\d]+\.\d\d/
  end

end

test "markup needed for store.js.coffee is in place" do
  get :index
  assert_select '.store .entry > img', 3
  assert_select '.entry input[type=submit]', 3
end
