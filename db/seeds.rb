# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

monsters = [
    {
        name: 'Freddy Kreuger',
        age: 26,
        specialty: 'Dream Demon',
        quote: "Tell 'em Freddy sent ya!",
        image: 'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Freddy_Krueger_%28Robert_Englund%29.jpg/220px-Freddy_Krueger_%28Robert_Englund%29.jpg',
    },
    {
        name:'Pennywise',
        age: 40,
        specialty:'Trans-dimensional Demonic Alien',
        quote:'Time to float.',
        image:'https://images.app.goo.gl/Qaxt9KuSWEJcigM2A',
    },
    {
        name: 'Ghostface',
        age: 28,
        specialty: 'Serial Killer',
        quote: "'You Hang Up On Me Again, I'll Gut You Like A Fish.'",
        image: 'https://upload.wikimedia.org/wikipedia/en/thumb/a/ac/Ghostface.jpg/220px-Ghostface.jpg',
    },
    {
        name:'Samara Morgan',
        age: 8,
        specialty:'Vengeful Ghost',
        quote:'Seven days.',
        image:'https://images.app.goo.gl/XPUnf6DcyPDzoBZMA',
    }
]

monsters.each do |value|
    Monster.create value
end

p Monster.all