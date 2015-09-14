Fix Democracy First
===================
This web site and platform supports uploading, approval and redistribution of videos answering the question: "Tell us your story of why we need to #FixDemocracyFirst." http://fixdemocracyfirst.us 

3rd-Party Depedencies
---------------------
1. [RVM](http://rvm.io)
1. [postgres](http://www.postgresql.org)
1. [redis](http://redis.io)
1. [Elastic Search](https://www.elastic.co/products/elasticsearch)

Do not proceed until you have all the dependencies installed and running. (On OSX, your best bet is to install postgres, redis and elastic search using [homebrew](http://brew.sh/).)

Local Environment Setup
-----------------------
1. Clone the git repo
1. Install Ruby 2.2.1 on RVM: `rvm install 2.2.1`
1. Select the global gemset under ruby 2.2.1: `rvm use 2.2.1@fixdemocracyfirst`
1. Install Bundler in the global gemset: `gem install bundler`
1. Create a custom gemset for fixdemocracy: `rvm gemset create fixdemocracyfirst`
1. Select the gemset and ruby version: `rvm use 2.2.1@fixdemocracyfirst`
1. `cd` into your local git repo's directory
1. Run bundler: `bundle install`
1. Set environment variables for foreman by creating a `.env` file in your project directory with these variables (and ask one of us for the missing values so we can get them to you securely):

    ```
    S3_BUCKET=fixdemocracyfirst-stage
    AWS_ACCESS_KEY_ID=
    AWS_SECRET_ACCESS_KEY=
    AWS_REGION=us-west-1
    REDISTOGO_URL=redis://127.0.0.1:6379/
    RAILS_RESQUE_REDIS=redis://127.0.0.1:6379/
    RESQUE_ADMIN_PASSWORD= #set this to whatever value you like
    SEARCHBOX_URL=http://localhost:9200
    JANRAIN_API_KEY=
    URL=http://localhost:3000
    ```
1. Create and seed the database: `foreman run bundle exec rake db:setup`
1. Start the server locally: `foreman run bundle exec rails s`
1. Visit [http://localhost:3000](http://localhost:3000)
1. Create an account for yourself by visiting [http://localhost:3000/admin](http://localhost:3000/admin) and logging in with Facebook
1. Launch a rails console `foreman run bundle exec rails c` and execute this command to admin-ize your user account: `User.last.update_attribute(:admin, true)`

Note: When viewing the [Resque Web Console](http://localhost:3000/resque_web) for the first time, you'll receive a basic auth challenge. Respond with username `fixdemocracyfirst` and the password you set for `RESQUE_ADMIN_PASSWORD` in your .env file and ask the browser to remember your credentials (if you want).

Contributing (using the [fork-and-pull](https://help.github.com/articles/using-pull-requests) model)
----------------------------------------------------------------------------------------------------
1. Fork the repo
1. Create a topic branch `git checkout -b my-new-feature`
1. Implement your feature or bug fix and add tests
1. Ensure that `foreman run bundle exec rake` passes
1. Commit your changes `git commit -am 'Added some feature and some tests'`
1. Push to the branch `git push origin my-new-feature`
1. Create a pull request

## Code of Conduct

The Lessig Equal Citizens Exploratory Committee is committed to fostering an open and inclusive community where engaged, dedicated volunteers can build the strategy and tools necessary to fix our country's democracy. All members of the community are expected to behave with civility, speak honestly and treat one another respectfully.

This project adheres to the [Open Code of Conduct][http://todogroup.org/opencodeofconduct/#Lessig2016/conduct@lessigforpresident.com]. 
By participating, you are expected to honor this code.

This reference as well as the included copy of the [Code of Conduct](https://github.com/Lessig2016/fixdemocracyfirst/blob/master/CONDUCT.md)
shall be included in all forks and distributions of this repository.

## Legal

The Lessig campaign is not responsible for the content posted to this repository, or for actions taken or liabilities incurred by one or more group members. 

You may not post content to the repository that you do not own, and by posting content you consent to its use by others, including the campaign. 

You are responsible for your compliance with federal campaign finance laws. You may not, for example, volunteer for the campaign if you are being paid by someone else to do so, or volunteer while at work unless it is limited to a few hours per month and your volunteering doesn’t create additional costs for your employer.

The campaign may remove any offensive, abusive, attacking, or discriminatory content, as well as any content that may otherwise violate our [Terms of Service](https://lessig2016.us/terms-of-service/). 

## Copyright and License

Copyright 2015 Lessig Equal Citizens Exploratory Committee. This 
project is released under [GNU Affero General Public License, version 3](https://github.com/Lessig2016/fixdemocracyfirst/blob/master/LICENSE).

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
