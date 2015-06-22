module SpatialInterfaceTest
  def test_implements_spatial_interface
    assert_respond_to @object, :scale
    assert_respond_to @object, :translate
    assert_respond_to @object, :rotate_x
    assert_respond_to @object, :rotate_y
    assert_respond_to @object, :rotate_z
    assert_respond_to @object, :project
  end
end