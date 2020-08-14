# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# <h1><%= @cat.name %></h1>

# <h2>Age:<%= @cat.age %></h2>
# <h2>Birthday:<%= @cat.birthdate %></h2>
# <h2>Color:<%= @cat.color %></h2>
# <h3>Sex:<%= @cat.sex == "M" ? "Male" : "Female" %></h3>
# black white brown gray orange
Cat.destroy_all

Cat.create([
    {birthdate: '1995/06/10', name: 'Bella', sex: 'F', color: 'orange', description: 'Likes long walks on the beach'},
    {birthdate: '2000/08/28', name: 'Sarah', sex: 'F', color: 'white', description: 'Quiet'},
    {birthdate: '1992/03/05', name: 'Garfield', sex: 'M', color: 'orange', description: 'Fat'},
    {birthdate: '2004/04/10', name: 'Grump', sex: 'M', color: 'black', description: 'Grumpy'},
    {birthdate: '1996/07/15', name: 'Kevin', sex: 'M', color: 'orange'},
    {birthdate: '1997/02/20', name: 'Oliver', sex: 'M', color: 'brown'},
    {birthdate: '1993/03/05', name: 'Jourdan', sex: 'M', color: 'black'},
    {birthdate: '1995/12/23', name: 'George', sex:'M', color: 'gray', description: 'This cat is very boring'},
    {birthdate: '1996/1/15', name: 'Sassy', sex:'F', color: 'brown', description: 'This cat is very sassy'},
    {birthdate: '1990/11/03', name: 'Oreo', sex:'F', color: 'black', description: 'This cat looks like an oreo'}
])