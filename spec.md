# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
    ActiveRecord is used as shown in the models, and migrations
- [x] Include more than one model class (e.g. User, Post, Category)
    Has Users, Rooms, Jobs, and Estimates
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    User has many Jobs, Job has many Rooms
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Jobs belong to user, and rooms belong to job
- [x] Include user accounts with unique login attribute (username or email)
    Before signing up, the program checks if it can find a user with the email you are trying to sign up with, and redirects you to signup if it finds another user with said email.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    jobs can be indexed, shown, created, edited, and deleted
- [x] Ensure that users can't modify content created by other users
    on any patch, edit, or delete route, its checks to see if the user ID of that room or job matches the current user. If it does not, it redirects you to login
- [x] Include user input validations
    All input fields are required so blank data cant be sent in. Time, date, and number fields are set as such so that they only accept that type of data.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
    at least 3 a day
- [x] Your commit messages are meaningful
    All messages explain specifically what changed due to that commit
- [x] You made the changes in a commit that relate to the commit message
    All messages explain specifically what changed due to that commit
- [x] You don't include changes in a commit that aren't related to the commit message
    All messages explain specifically what changed due to that commit