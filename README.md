# Animal_Shelter_Project
This application was written during the first project week at CodeClan.

The app was written using the following software:

- Ruby
- Sinatra framework
- PostgreSQL database
- HTML
- CSS

## Running the app in development
Commands should be run from the highest level of the file structure

1. Open psql
> psql
2. Create Database
> CREATE DATABASE shelter
3. Run SQL file
> psql -d shelter -f db/animal_shelter.sql
4. Run the app
> ruby app.rb

## Brief
The owner of a record store wants an app which will help him keep on top of his store inventory.They do not want an 
app that customers will see, but they will use to check stock levels and see what he needs to order soon.

They are looking for a management system to keep track of their animals and owners.

## MVP:
- A list of all their animals and their admission date
- Mark an animal as being adoptable/not adoptable
- Assign an animal to a new owner
- List all the owners and their adopted animals

## Possible Extensions:
- CRUD actions for animals/owners
- Have separate pages for animals ready for adoption and ones still in training/vet care
- Search for animals by breed/type
- Any other ideas you might come up with
