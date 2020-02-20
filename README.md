# liquid-refreshment
Liquid Refreshment is an sinatra application that I created to help me keep
track of a constantly changing roster of beers at a local brewery I frequent.
This brewery releases a handful of beers every month, and has a constant rotation
throughout the year. Every January they have a big birthday party, and a vote
leading up to it to 'bing back a beer' but the problem is that no one can rember
what the hell they drank in the year prior. This application aims to solve that
problem by allowing any user to add or edit a beer description (sometimes they
can be very long an nonsensical) wikipedia style, but then also rate a beer as
it pertains to their personal account so they can keep track of what they rated
over the corse of the year.

## Installation
To install this application onto your local machine:  


- clone the repository from [GitHub](https://github.com/capricious-slingshot/liquid-refreshment)
- 'cd' into the directory
- After checking out the repo, run `bundle exec rake install` to install dependencies
- run `rake db:migrate` to create your DB & run migrations
- run `rake db:seed` to seed your DB from the optional seed file provided
- spin up application by starting your server with 'shotgun'

  Enjoy Drinking Beer!

## Usage
 A short video I made on how to use this application:

[Liquid Refreshment Sinatra Application Demo]()

Additionaly, here is a blog post about creating my first application:
[Liquid Refreshment Sinatra Application]()

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/capricious-slingshot/liquid-refreshment)

## License

The application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
