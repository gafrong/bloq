require 'rails_helper'

RSpec.describe Design, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'tests show me nil' do
    design = Design.new
    expect(design.info).to eq nil
  end


end
