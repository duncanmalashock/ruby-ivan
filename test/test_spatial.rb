# require_relative "minitest_helper"

# class ThreeDSpatialClassDouble
#   include Spatial
#   attr_accessor :points

#   def initialize
#     @points = [ThreeDPointFixture.new]
#   end
# end

# class TwoDSpatialClassDouble
#   include Spatial
#   attr_accessor :points

#   def initialize
#     @points = [TwoDPointFixture.new]
#   end
# end

# describe Spatial do
#   describe "when included in a class with 3D points" do
#     before do
#       @spatial_type_3D = @object = ThreeDSpatialClassDouble.new
#     end

#     describe "after initialization" do
#       include SpatialInterfaceTest
#       it "has the right number of instructions" do
#         assert_equal 1, @spatial_type_3D.points.length
#       end
#       it "responds to the Spatial interface" do
#         test_implements_spatial_interface
#       end
#     end

#   describe "when included in a class with 2D points" do
#     before do
#       @spatial_type_2D = @object = TwoDSpatialClassDouble.new
#     end

#     describe "after initialization" do
#       include SpatialInterfaceTest
#       it "has the right number of instructions" do
#         assert_equal 1, @spatial_type_2D.points.length
#       end
#       it "responds to the Spatial interface" do
#         test_implements_spatial_interface
#       end
#     end

#     describe "after rotating on the X axis" do
#       it "has points with the correct coordinates" do
#         @spatial_type_2D = @spatial_type_2D.rotate_x(2.0)
#         assert_equal 10, @spatial_type_2D.points[0].x
#         assert_equal -8.322936730942848, @spatial_type_2D.points[0].y
#         assert_equal 18.185948536513635, @spatial_type_2D.points[0].z
#       end
#     end

#     describe "after rotating on the Y axis" do
#       it "has points with the correct coordinates" do
#         @spatial_type_2D = @spatial_type_2D.rotate_y(2.0)
#         assert_equal -4.161468365471424, @spatial_type_2D.points[0].x
#         assert_equal 20, @spatial_type_2D.points[0].y
#         assert_equal -9.092974268256818, @spatial_type_2D.points[0].z
#       end
#     end
#   end
# end