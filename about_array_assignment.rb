require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrayAssignment < Neo::Koan
  def test_non_parallel_assignment
    names = ["John", "Smith"]
    assert_equal ["John", "Smith"], names
  end
 
  # PARALLEL ASSIGNMENT! 
  def test_parallel_assignments
    first_name, last_name = ["John", "Smith"]
    assert_equal "John", first_name
    assert_equal "Smith", last_name
  end
  
  # extra values are dropped
  def test_parallel_assignments_with_extra_values
    first_name, last_name = ["John", "Smith", "III"]
    assert_equal "John", first_name
    assert_equal "Smith", last_name
  end
  
  # splat sccops up extra values in array
  def test_parallel_assignments_with_splat_operator
    first_name, *last_name = ["John", "Smith", "III"]
    assert_equal "John", first_name
    assert_equal ["Smith", "III"], last_name
  end
  
  # assigning a non extant value assigns NIL
  def test_parallel_assignments_with_too_few_variables
    first_name, last_name = ["Cher"]
    assert_equal "Cher", first_name
    assert_equal nil, last_name
  end
  
  # nested arrays are preserved
  def test_parallel_assignments_with_subarrays
    first_name, last_name = [["Willie", "Rae"], "Johnson"]
    assert_equal ["Willie", "Rae"], first_name
    assert_equal "Johnson", last_name
  end
  
  # not trailing comma, implies parallel assignment even with no second variable
  def test_parallel_assignment_with_one_variable
    first_name, = ["John", "Smith"]
    assert_equal "John", first_name
  end
  
  # parralel assignment lets you swap things, or swap one varaible and change the other
  def test_swapping_with_parallel_assignment
    first_name = "Roy"
    last_name = "Rob"
    first_name, last_name = last_name, first_name
    assert_equal "Rob", first_name
    assert_equal "Roy", last_name
  end
end
