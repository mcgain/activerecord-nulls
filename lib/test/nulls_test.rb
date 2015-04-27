class NullsTest < Minitest::UnitTest
  def test_find_by_array_of_one_id
    assert_kind_of(Array, Topic.find([ 1 ]))
    assert_equal(1, Topic.find([ 1 ]).length)
  end

  def test_find_by_ids
    assert_equal 2, Topic.find(1, 2).size
    assert_equal topics(:second).title, Topic.find([2]).first.title
  end

  def test_find_by_ids_with_limit_and_offset
    assert_equal 2, Entrant.limit(2).find([1,3,2]).size
    assert_equal 1, Entrant.limit(3).offset(2).find([1,3,2]).size

    # Also test an edge case: If you have 11 results, and you set a
    #   limit of 3 and offset of 9, then you should find that there
    #   will be only 2 results, regardless of the limit.
    devs = Developer.all
    last_devs = Developer.limit(3).offset(9).find devs.map(&:id)
    assert_equal 2, last_devs.size
  end

  def test_find_with_large_number
    assert_raises(ActiveRecord::RecordNotFound) { Topic.find('9999999999999999999999999999999') }
  end

  def test_find_by_with_large_number
    assert_nil Topic.find_by(id: '9999999999999999999999999999999')
  end

  def test_find_by_id_with_large_number
    assert_nil Topic.find_by_id('9999999999999999999999999999999')
  end

  def test_find_on_relation_with_large_number
    assert_nil Topic.where('1=1').find_by(id: 9999999999999999999999999999999)
  end

  def test_find_by_bang_on_relation_with_large_number
    assert_raises(ActiveRecord::RecordNotFound) do
      Topic.where('1=1').find_by!(id: 9999999999999999999999999999999)
    end
  end
end
