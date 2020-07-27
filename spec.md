# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - All the get, patch, post, delete methods in my Controller's folder.
- [x] Use ActiveRecord for storing information in a database - included ActiveRecord and used it's powers to help create the database
- [x] Include more than one model class (e.g. User, Post, Category) - Owner, Pets, Pictures
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - Owner has many pets, Pets has many Pictures through petpictures
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Pets belong to Owner
- [x] Include user accounts with unique login attribute (username or email) - Validates usernames
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Users can NOT view pets owned by others, their own pets, and pets with no owner.
- [x] Ensure that users can't modify content created by other users - User's can only edit THEIR pet's profile and adad pictures to it.
- [x] Include user input validations - Usernames validated, so no duplicates
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
