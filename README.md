# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### Project Option 1: IdeaBox

Let's create an app to record your ideas. Host your app live on Heroku.

#### Ideas

- [x] An idea can be created by a user.
- [x] An idea can be edited/updated only by the user that created it.
- [x] An idea can be destroyed only by the user that created it.
- [x] When a user types a new idea into the form, there is a [selection dropdown](http://guides.rubyonrails.org/form_helpers.html#option-tags-from-a-collection-of-arbitrary-objects) for choosing the correct category. See Categories below for more information.

#### Categories

- [x] Ideas belong to a category.
- [x] Categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create categories).
- [x] Categories can be destroyed by a logged-in admin user (regular logged in users cannot destroy categories).

#### Images

- [x] Users can add an image to their own idea.
- [x] An image can have many ideas and an idea can have many images.
- [x] Images can only be created by an admin user.
  - The most simplistic way to implement images is to store a url to an online image. If you're feeling fancy and want to upload your own images, check out [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) or [Paperclip](https://github.com/thoughtbot/paperclip).

#### Authentication and Authorization

- [ ] Users need to log in to see their ideas.
- [ ] Users can only see their own ideas -- they should not be able to visit another user's page.
- [ ] Users cannot create ideas for other users.
- [ ] Users cannot create new categories -- only the admin can do that.
- [ ] Users cannot create images -- only the admin can do that; however, a user can assign an image to their idea.
- [x] Visitors can create user accounts.

### User Experience

- [ ] The application has been styled.
- [ ] The application uses a balanced, considered color scheme.
- [ ] The application implements a font (that is not the default font).
- [ ] The application utilizes a nav bar.
- [ ] The style shows evidence of intentional layout.
- [ ] Space and text is balanced. White space is used to visually separate content.
- [ ] The application is easily usable. The user can intuitvely navigate between different portions of the application without manually entering the URL into the nav-bar or using the back button on their browser.

### Database

- [x] Properly implements a one-to-many relationship
- [x] Properly implements a many-to-many relationship
- [x] Utilizes primary and foreign keys appropriately

### Code Quality

- [x] Logic lives in the appropriate files
- [x] Methods are refactored and follow SRP
- [x] Naming follows convention

### Testing

- [x] Project has a running test suite
- [x] Test suite includes robust feature tests
- [x] Test suite includes tests for validations
- [x] Test suite includes tests for methods that they have created on the models
