# Rails Base

It's based on Rails 5 and Ruby 2.5.1

## Application Gems

- [Interactors](https://github.com/collectiveidea/interactor) encapsulates application's business logic
- [Kaminari](https://github.com/amatsuda/kaminari) for pagination
- [Fast JSON:API](https://github.com/Netflix/fast_jsonapi) lightning fast JSON:API serializer for Ruby Objects
- [Responders](https://github.com/plataformatec/responders) a set of Rails responders to dry up rails application
- [ActsAsParanoid](https://github.com/ActsAsParanoid/acts_as_paranoid) plugin to add soft delete
- [PaperTrail](https://github.com/paper-trail-gem/paper_trail) for track model changes
- [Enumerize](https://github.com/brainspec/enumerize) enumerated attributes with I18n and ActiveRecord/Mongoid support

## Development Gems

- [Puma](https://github.com/puma/puma) as Rails web server
- [Rubocop](https://github.com/bbatsov/rubocop) and [Rubocop-Rspec](https://github.com/nevir/rubocop-rspec)
  for reporting violations of the Ruby style guide
- [Brakeman](https://github.com/presidentbeef/brakeman) for checking application for common security vulnerabilities
- [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading
- [Rails ERD](https://github.com/voormedia/rails-erd) for generating a diagram based on application's AR models
- [Byebug](https://github.com/deivid-rodriguez/byebug) debugging in ruby
- [Annotate](https://github.com/ctran/annotate_models) annotate Rails classes with schema and routes info

## Testing Gems

- [Factory Bot](https://github.com/thoughtbot/factory_bot_rails) for test data
- [RSpec](https://github.com/rspec/rspec) for unit testing
- [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for common RSpec matchers
- [Rswag](https://github.com/domaindrivendev/rswag) seamlessly adds a Swagger to Rails-based API's

## Initializers

- `rack_cors.rb` - handling cross-origin resource sharing

## Scripts

- `bin/setup` - setup required gems and migrate db if needed
- `bin/quality` - runs rubocop and brakeman for the app
- `bin/server` - to run server locally

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC installed on your development machine.

- `graphviz` - to generate Entity-Relationship Diagram

### Bootstrap application (wtih docker-compose)

1. Run app

```bash
docker-compose build
docker-compose up
```

2. Run setup script

```bash
docker-compose exec app bin/setup
```

3. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

```bash
docker-compose exec app bin/ci
```

4. Update README

Do not forget to update application `README.md` file with detailed information based on the
existing template.

```bash
mv doc/README_TEMPLATE.md README.md
# update README.md
git commit -am "Update README.md"
```

5. Run tests

```bash
   docker-compose exec app rspec

```

6. Run and update swagger

```bash
 docker-compose exec app rake rswag:specs:swaggerize
 endpoint: http://localhost:5000/api-docs/index.html

```

## Deployment

TODO: deploy scripts

##
