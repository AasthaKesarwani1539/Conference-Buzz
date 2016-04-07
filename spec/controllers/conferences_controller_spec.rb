require 'spec_helper'

describe ConferencesController do

	before(:index) do
		@conference = create(:conference)
	end

	describe "GET index" do
		it "should display all the confernces" do
			get(:index)
			expect(assigns(:conferences)).should eq([@confernce])
		end
	end

end