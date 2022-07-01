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
     it 'does not create a monster without an name' do
      monster_params = {
        monster: {
          age: 30,
          specialty: 'Demon Doll',
          quote: "Hi, I'm Chucky",
          image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
        }
      }
      post '/monsters', params: monster_params
      expect(response).to have_http_status(422)
      monster = JSON.parse(response.body)
      expect(monster['name']).to include "can't be blank"
      end
      it 'does not create a monster without an age' do
        monster_params = {
          monster: {
            name:'Chucky',
            specialty: 'Demon Doll',
            quote: "Hi, I'm Chucky",
            image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
          }
        }
        post '/monsters', params: monster_params
        expect(response).to have_http_status(422)
        monster = JSON.parse(response.body)
        expect(monster['age']).to include "can't be blank"
        end
        it 'does not create a monster without an specialty' do
          monster_params = {
            monster: {
              name:'Chucky',
              age: 30,
              quote: "Hi, I'm Chucky",
              image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['specialty']).to include "can't be blank"
        end
        it 'does not create a monster without an quote' do
          monster_params = {
            monster: {
              name:'Chucky',
              age: 30,
              specialty: 'Demon Doll',
              image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['quote']).to include "can't be blank"
        end
        it 'does not create a monster without an image' do
          monster_params = {
            monster: {
              name:'Chucky',
              age: 30,
              specialty: 'Demon Doll',
              quote: "Hi, I'm Chucky",
              
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['image']).to include "can't be blank"
        end
        it 'does not create a monster with a name less than two characters' do
          monster_params = {
            monster: {
              name:'C',
              age: 30,
              specialty: 'Demon Doll',
              quote: "Hi, I'm Chucky",
              image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['name']).to include "is too short (minimum is 2 characters)"
        end
        it 'does not create a monster with an age less than one character' do
          monster_params = {
            monster: {
              name:'Chucky',
              specialty: 'Demon Doll',
              quote: "Hi, I'm Chucky",
              image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['age']).to include "is too short (minimum is 1 character)"
        end
        it 'does not create a monster with a specialty less than 5 characters' do
          monster_params = {
            monster: {
              name:'Chucky',
              age: 30,
              specialty: 'Demo',
              quote: "Hi, I'm Chucky",
              image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['specialty']).to include "is too short (minimum is 5 characters)"
        end
        it 'does not create a monster with a quote less than 5 characters' do
          monster_params = {
            monster: {
              name:'Chucky',
              age: 30,
              specialty: 'Demon Doll',
              quote: "Hi",
              image: 'https://images.app.goo.gl/dbofFxU3e5Drsu3e9'
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['quote']).to include "is too short (minimum is 5 characters)"
        end
        it 'does not create a monster with an image less than 8 characters' do
          monster_params = {
            monster: {
              name:'Chucky',
              age: 30,
              specialty: 'Demon Doll',
              quote: "Hi, I'm Chucky",
              image: 'https'
            }
          }
          post '/monsters', params: monster_params
          expect(response).to have_http_status(422)
          monster = JSON.parse(response.body)
          expect(monster['image']).to include "is too short (minimum is 8 characters)"
        end
    end

    #  name:'Chucky', age: 30, specialty: 'Demon Doll', quote: "Hi, I'm Chucky"
   describe "PATCH /update" do
    it "updates a monster that exists in the database" do 
      Monster.create(
          name:'Pennywise',
          age: 40,
          specialty:'Trans-dimensional Demonic Alien',
          quote:'Time to float.',
          image:'https://images.app.goo.gl/Qaxt9KuSWEJcigM2A',
      )
      monster = Monster.first 

      updated_monster_params = {
        monster: {
           name:'Pennywise',
           age: 900,
           specialty:'Trans-dimensional Demonic Alien',
           quote:'Time to float.',
           image:'https://images.app.goo.gl/Qaxt9KuSWEJcigM2A',
        }
       }
       patch "/monsters/#{monster.id}", params: updated_monster_params

       expect(response).to have_http_status(200)
       updated_monster = Monster.find(monster.id)
       expect(monster.age).to eq 40
       expect(updated_monster.age).to eq 900
    end
   end
   describe "DELETE /destroy" do
    it "deletes a monster from the database" do 
      Monster.create(
          name:'Pennywise',
          age: 40,
          specialty:'Trans-dimensional Demonic Alien',
          quote:'Time to float.',
          image:'https://images.app.goo.gl/Qaxt9KuSWEJcigM2A',
      )
      monster = Monster.first 

       delete "/monsters/#{monster.id}"

       expect(response).to have_http_status(200)
    end
    end
end
