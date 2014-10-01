require_relative '../prime_numbers'
require_relative 'spec_helper'

describe 'is_number_prime?' do
  it 'includes the number 2' do
    expect(is_number_prime?(2)).to eq(true)
  end
  it 'includes the number 3' do
    expect(is_number_prime?(3)).to eq(true)
  end
  it 'includes the number 5' do
    expect(is_number_prime?(5)).to eq(true)
  end
  it 'does not include the number 6' do
    expect(is_number_prime?(6)).to eq(false)
  end
  it 'includes the number 7' do
    expect(is_number_prime?(7)).to eq(true)
  end
  it 'does not include the number 12' do
    expect(is_number_prime?(12)).to eq(false)
  end
  it 'includes the number 13' do
    expect(is_number_prime?(13)).to eq(true)
  end
  it 'does not include the number 14' do
    expect(is_number_prime?(14)).to eq(false)
  end
  it 'does not include the number 15' do
    expect(is_number_prime?(15)).to eq(false)
  end
  it 'includes the number 17' do
    expect(is_number_prime?(17)).to eq(true)
  end
  it 'does not include the number 305' do
    expect(is_number_prime?(305)).to eq(false)
  end
  it 'does include the number 2719' do
    expect(is_number_prime?(2719)).to eq(true)
  end
  it 'does not include the number 2720' do
    expect(is_number_prime?(2720)).to eq(false)
  end
  it 'does include the number 6361' do
    expect(is_number_prime?(6361)).to eq(true)
  end
  it 'does include the number 5915587277' do
    expect(is_number_prime?(5915587277)).to eq(true)
  end
  it 'does not include the number 5915587278' do
    expect(is_number_prime?(5915587278)).to eq(false)
  end
end