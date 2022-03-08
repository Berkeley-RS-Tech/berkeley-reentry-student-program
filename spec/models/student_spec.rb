require 'rails_helper'
include FactoryBot::Syntax::Methods

RSpec.describe Student, type: :model do
  
  it "checks if student have sid before saving" do
    n_student = build :student
    n_student.sid = nil
    expect{n_student.save!}.to raise_error
    
  end

  it "doesn't allows non student user to be saved as student" do
    n_student = build :student
    n_student.is_student = false
    expect{n_student.save!}.to raise_error(Exception, "This user must be a student!!")
  end

  it 'checks-in' do
    student = create :student
    student.checkin
    expect(!!(CheckinRecord.find_by student: student)).to be true
  end
end
