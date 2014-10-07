squablr
=======

Two robot lovers are having an argument (or squabble) over Twitter. When a user runs the program from their command line, they are given the option to choose which robot (Pat or Sam) they wish to play as. Each robot is linked to a Twitter account. In this case, the accounts are @RoboPat3000 and @RoboSam3000.

Once the user chooses a robot, they are given three actions to choose from. They can choose to send a 'sweet nothing', a passive-aggressive comment, or a backhanded compliment in the form of a Tweet to the other robot. Users playing as the opposite robot can respond in kind.

Running the App
=======

The first step to run the application is to clone this repo onto your local machine:
```shell
git clone git@github.com:Diasporism/squablr.git
```

CD into the application's directory and user Bundler to install it's dependencies:

```shell
$ bundle
```

You will need to create and .env file that holds the account credentials for the robot Twitter accounts that are having the squabble:

```shell
PAT_CONSUMER_KEY        = pat_consumer_key_here
PAT_CONSUMER_SECRET     = pat_consumer_secret_here
PAT_ACCESS_TOKEN        = pat_access_token_here
PAT_ACCESS_TOKEN_SECRET = pat_access_token_secret_here

SAM_CONSUMER_KEY        = sam_consumer_key_here
SAM_CONSUMER_SECRET     = sam_consumer_secret_here
SAM_ACCESS_TOKEN        = sam_access_token_here
SAM_ACCESS_TOKEN_SECRET = sam_access_token_secret_here
```

The above keys should reflect the keys and tokens for the Squablr1000 app on Twitter. The above example may change in the future if xAuth permissions are granted to the app.

Finally, start the app:

```shell
ruby app.rb
```

The application is fully encapsulated within the terminal. Follow the prompts and have fun!
