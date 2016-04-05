require 'spec_helper'
describe 'gnome' do

  context 'with defaults for all parameters' do
    it { should contain_class('gnome') }
  end
end
