require 'spec_helper'

describe Sprint do
  it { should validate_presence_of :User_id }
  it { should validate_numericality_of :User_id }
  it { should validate_presence_of :name }
end
