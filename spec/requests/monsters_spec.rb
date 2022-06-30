require 'rails_helper'

RSpec.describe "Monsters", type: :request do
  describe "GET /index" do
   it 'returns all the monsters in the database when the endpoint of get /monsters is hit' do

    Monster.create(
        name:'Pennywise',
        age: 40,
        specialty:'Trans-dimensional Demonic Alien',
        quote:'Time to float.',
        image:'https://images.app.goo.gl/Qaxt9KuSWEJcigM2A',
    )

      get '/monsters'

      pennywise = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(pennywise.length).to eq 1
    end
  end
  describe "POST /create" do
    it 'creates a monster' do
 
     monster_params ={
      monster: {
         name:'Pennywise',
         age: 40,
         specialty:'Trans-dimensional Demonic Alien',
         quote:'Time to float.',
         image:'https://images.app.goo.gl/Qaxt9KuSWEJcigM2A',
      }
     }
 
       post '/monsters', params: monster_params

       expect(response).to have_http_status(200)
       
       monster = Monster.first
       expect(monster.name).to eq 'Pennywise'
       expect(monster.age).to eq 40
       expect(monster.specialty).to eq 'Trans-dimensional Demonic Alien'
       expect(monster.quote).to eq 'Time to float.'
       expect(monster.image).to eq 'https://images.app.goo.gl/Qaxt9KuSWEJcigM2A'
     end
   end
end
