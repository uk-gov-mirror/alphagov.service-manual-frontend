require 'test_helper'

class ServiceManualServiceStandardTest < ActionDispatch::IntegrationTest
  test "service standard page has a title" do
    setup_and_visit_example('service_manual_service_standard', 'service_manual_service_standard')

    assert page.has_content?("Digital Service Standard"), "No title found"
  end

  test "service standard page has points" do
    setup_and_visit_example('service_manual_service_standard', 'service_manual_service_standard')

    assert_equal 2, points.length

    within(points[0]) do
      assert page.has_content?("1. Understand user needs"), "Point not found"
      assert page.has_content?("Summary goes here"), "Summary not found"
      assert page.has_link?("Read more about point 1", href: "/service-manual/service-standard/understand-user-needs"), "Link not found"
    end

    within(points[1]) do
      assert page.has_content?("2. Do ongoing user research"), "Point not found"
      assert page.has_content?("Another summary goes here"), "Summary not found"
      assert page.has_link?("Read more about point 2", href: "/service-manual/service-standard/do-ongoing-user-research"), "Link not found"
    end
  end

  test "each point has an anchor tag so that they can be linked to externally" do
    setup_and_visit_example('service_manual_service_standard', 'service_manual_service_standard')

    within('div[id="criterion-1"]') do
      assert page.has_content?("1. Understand user needs"), "Anchor is incorrect"
    end

    within('div[id="criterion-2"]') do
      assert page.has_content?("2. Do ongoing user research"), "Anchor is incorrect"
    end
  end

  def points
    find_all('.service-standard-point')
  end
end