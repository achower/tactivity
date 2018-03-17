# TACTIVITY
**Link to project:** https://quiet-tor-53873.herokuapp.com/

![Tactivity Home Page](https://raw.githubusercontent.com/achower/tactivity/master/public/images/Home_Page.png)

An interpretation of the [Pinteresting project](https://github.com/search?utf8=%E2%9C%93&q=pinteresting&type=) (find other examples here) thats purpose was to try to understand and recreate how a mainstream application functions

Registered users can create, update and delete their own tacs. Any user can read any tac.

## How It's Made:

**Tech used:** HTML, CSS, JavaScript, Ruby, Rails

**Important Gems:**

* Devise - for User Authentication

* Postgres - for production database when using Heroku

* Paperclip - for uploading images

* Aws-sdk - for storing images on production

* Masonry-rails - for smooth transitions for when tacs are resized or are moved from creation/deletion

Set up the application on Heroku, then set up your AWS account here:
* http://aws.amazon.com/

And Read this:
* https://devcenter.heroku.com/articles/paperclip-s3

Add the following to your config/environments/production.rb file, then add your keys via the Heroku UI

  config.paperclip_defaults = {
  storage: :s3,
  s3_protocol: :https,
  s3_credentials: {
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION'),
    }
  }

This app was my first exploration into the bootstrap library. (I love it)

## Challenges:

Biggest struggle was getting AWS set up. You need to give it a credit card because after a year you'll start paying for the service. The original instructions I was following didn't mention that you would need to also provide the protocol type and region for your bucket, which I included in the code snippet above.

## Known Issues:

As of 16-Mar-2018, I updated the paperclip gem after I was notified about a security vulnerability, this has caused the app to crash. I will need to investigate further to make the app usable again. It is most likely how it interacts with AWS-SDK, but I will need to do more research and testing.
