# frozen_string_literal: true

require_relative "test_helper"

class TestDistributedMerge < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DistributedMerge::VERSION
  end

  def test_raises_no_method_error
    string = "string"
    assert_raises(NoMethodError) { string.distributed_merge }

    hash = { key: "value" }
    assert_raises(NoMethodError) { hash.distributed_merge }
  end

  def test_returns_original_array_if_not_two_dimensional
    one_d = [1, 2, 3, 4, 5]
    assert_equal one_d, one_d.distributed_merge

    three_d = [[[1, 2, 3], [4, 5]], [6, 7, 8, 9, 10]]
    assert_equal three_d, three_d.distributed_merge
  end

  def test_case_10_vs_1_array
    array_one = ["a"]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    two_d = [array_one, array_two]
    expected_result = [1, 2, 3, 4, 5, "a", 6, 7, 8, 9, 10]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_11_vs_2_array
    array_one = %w[a b]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    two_d = [array_one, array_two]
    expected_result = [1, 2, 3, "b", 4, 5, 6, 7, 8, "a", 9, 10, 11]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_10_vs_3_array
    array_one = %w[a b c]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    two_d = [array_one, array_two]
    expected_result = [1, 2, 3, "b", 4, 5, 6, 7, "a", 8, "c", 9, 10]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_11_vs_4_array
    array_one = %w[a b c d]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    two_d = [array_one, array_two]
    expected_result = [1, 2, "d", 3, 4, "b", 5, 6, 7, "a", 8, "c", 9, 10, 11]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_10_vs_5_array
    array_one = %w[a b c d e]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    two_d = [array_one, array_two]
    expected_result = [1, 2, "d", 3, 4, "b", 5, 6, "a", 7, "c", 8, "e", 9, 10]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_11_vs_6_array
    array_one = %w[a b c d e f]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    two_d = [array_one, array_two]
    expected_result = [1, 2, "f", 3, "d", 4, 5, "b", 6, "a", 7, "c", 8, "e", 9, 10, 11]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_10_vs_7_array
    array_one = %w[a b c d e f g]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    two_d = [array_one, array_two]
    expected_result = [1, "f", 2, "d", 3, 4, "b", 5, 6, "a", 7, "c", 8, "e", 9, "g", 10]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_11_vs_8_array
    array_one = %w[a b c d e f g h]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    two_d = [array_one, array_two]
    expected_result = [1, "h", 2, "f", 3, "d", 4, 5, "b", 6, "a", 7, "c", 8, "e", 9, "g", 10, 11]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_10_vs_6_array
    array_one = %w[a b c d e f]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    two_d = [array_one, array_two]
    expected_result = [1, "f", 2, "d", 3, 4, "b", 5, 6, "a", 7, "c", 8, "e", 9, 10]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_case_11_vs_3_array
    array_one = %w[a b c]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    two_d = [array_one, array_two]
    expected_result = [1, 2, 3, 4, "b", 5, 6, 7, "a", 8, "c", 9, 10, 11]
    assert_equal expected_result, two_d.distributed_merge
  end

  def test_can_merge_two_dimensional_arrays_with_multiple_elements
    array_one = %w[a b c d]
    array_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    array_three = %w[A B C D E F G]
    two_d = [array_one, array_two, array_three]
    expected_result = [1, "F", 2, "D", "d", 3, 4, "b", "B", 5, 6, "A", 7, "a", "C", "c", 8, "E", 9, "G", 10]
    assert_equal expected_result, two_d.distributed_merge
  end
end
