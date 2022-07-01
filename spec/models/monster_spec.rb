require 'rails_helper'

RSpec.describe Monster, type: :model do
  describe 'presence' do
    it 'should validate name' do
      monster = Monster.create age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:name]).to_not be_empty
    end
    it 'should validate age' do
      monster = Monster.create name:'Chucky', specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:age]).to_not be_empty
    end
    it 'should validate specialty' do
      monster = Monster.create name:'Chucky', age: 30, quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:specialty]).to_not be_empty
    end
    it 'should validate quote' do
      monster = Monster.create name:'Chucky', age: 30, specialty: 'Demon Doll', image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:quote]).to_not be_empty
    end
    it 'should validate image' do
      monster = Monster.create name:'Chucky', age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky"
      expect(monster.errors[:image]).to_not be_empty
    end
  end
  describe 'Minimum Length' do
    it 'will validate a minimum length of monster name to 2' do
      monster = Monster.create name:'C', age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:name]).to_not be_empty
    end
    it 'will validate a minimum length of monster age to 1' do
      monster = Monster.create name:'Chucky', specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:age]).to_not be_empty
    end
    it 'will validate a minimum length of monster specialty to 5' do
      monster = Monster.create name:'Chucky', age: 30, specialty: 'Demo', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:specialty]).to_not be_empty
    end
    it 'will validate a minimum length of monster quote to 5' do
      monster = Monster.create name:'Chucky', age: 30, specialty: 'Demon Doll', quote: "Hi", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      expect(monster.errors[:quote]).to_not be_empty
    end
    it 'will validate a minimum length of monster image to 8' do
      monster = Monster.create name:'Chucky', age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https'
      expect(monster.errors[:image]).to_not be_empty
    end
  end
  describe 'Update presence' do 
    it 'will validate name and minimum length?' do 
      monster =   Monster.create name: 'Chucky', age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      updated_monster_params = {
           name:'',
           age: 30, 
           specialty: 'Demon Doll', 
           quote: "Hi, I'm Chucky", 
           image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
       }
        monster.update(updated_monster_params)
       p monster.errors[:name]
       expect(monster.errors[:name]).to_not be_empty
    end
    it 'will validate age and minimum length?' do 
      monster =   Monster.create name: 'Chucky', age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      updated_monster_params = {
           name:'Chucky',
           age: '',
           specialty: 'Demon Doll', 
           quote: "Hi, I'm Chucky", 
           image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
       }
        monster.update(updated_monster_params)
       p monster.errors[:age]
       expect(monster.errors[:age]).to_not be_empty
    end
    it 'will validate specialty and minimum length?' do 
      monster =   Monster.create name: 'Chucky', age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky", image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
      updated_monster_params = {
           name:'Chucky',
           age: 30, 
           specialty: '', 
           quote: "Hi, I'm Chucky", 
           image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
       }
        monster.update(updated_monster_params)
       p monster.errors[:specialty]
       expect(monster.errors[:specialty]).to_not be_empty
    end
  end
end
