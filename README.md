# Redesigning Twitter

## Project Specification

Redesigning Twitter with provided reference and adding basic features

Design For Reference - https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details

### MVP version of the app has the following features:

1. The user logs in to the app, only by typing the username (a proper authenticated login is **not** a requirement).

2. The user is presented with the homepage (see the _Homepage_ screenshot above) that includes:

   1. Left-side menu (includes only links to pages that are implemented).
   2. _Tweets_ tab in the centre (skip _Photos_ and _Videos_ for this MVP).
   3. Right-side section with *Who to follow (*skip _Trending for_ this MVP).

3. The _Tweets_ section includes:

   1. Simple form for creating a tweet.
   2. List of all tweets (sorted by most recent) that display tweet text and author details.

4. The _Who to follow_ section includes:

   1. List of profiles that are not followed by the logged-in user (ordered by most recently added).

5. When the user opens the profile page (see the _Userpage_ screenshot above), they can see:

   1. Left-side menu (includes only links to pages that are implemented).
   2. Cover picture and _Tweets_ tab in the centre (skip other tabs and _Tweet to user_ form).
   3. Right-side section with _Profile detailed info._

6. The _Profile detailed info_ section includes:

   1. User photo.
   2. Button to follow a user.
   3. Stats: total number of tweets, number of followers and number of following users.
   4. List of people who follow this user.

7. At the end extend your MVP app with one simple feature of your choice.

#### Without logging in

> ![screenshot](not_signed_in.png)

#### Logged in all users page

> ![screenshot](all_users.png)

#### Friend Request

> ![screenshot](request_friend.png)

#### Accept or Decline Friendship page

> ![screenshot](accept_decline_friend.png)

## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1

## Live Demo

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.2
Rails: 6.1.3
Postgres: >=9.5

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

### Deployment

From console run the following commands after cloning

```
   heroku login (login to heroku)
   heroku create stayintouch (or any app name you like)
   git push heroku main (pushing from the main branch)

```

## Authors

👤 **Author1**

- Github: [@akshay-narkar](https://github.com/akshay-narkar)
- Twitter: [Akshay](https://www.twitter.com/akidoit)

## 🤝 Contributing

Contributions, issues and feature requests are welcome! Start by:

- Forking the project
- Cloning the project to your local machine
- `cd` into the project directory
- Run `git checkout -b your-branch-name`
- Make your contributions
- Push your branch up to your forked repository
- Open a Pull Request with a detailed description to the development branch of the original project for a review

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thanks to Odin project for the tutorials.

## 📝 License

This project is [MIT](LICENSE) licensed.
