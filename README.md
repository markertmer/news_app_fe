<div id="top"></div>

# SPINSPOT
## version 1

SpinSpot is a Rails application designed to help readers compare similar news stories from different sources. For any given topic, SpinSpot will display three side-by-side stories, each with its own headline, image, summary, and name of the news source it was taken from. Readers can then "spot the spin" by comparing the different ways in which each news source treats the issue.  

- This repository is for the front end web application, which consumes the back end API. The project mimics a service-oriented architecture where the back end is responsible for consuming external APIs and exposing the information to the front end as users request articles for different topics. The back end repository can be found [here](https://github.com/stevenjames-turing/consultancy_news_BE)
- The application is currently deployed on Heroku and available for public consumption [here](https://news-app-fe.herokuapp.com)
- Articles related to one current topic will be displayed on the homepage. Users must sign in with Google to be able to search and browse for additional topics.

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

Follow these steps to get your own copy of the front end application.

### Prerequisites

- Ruby 2.7.4
- Rails 5.2.7
- Obtain a [Google OAuth](https://console.cloud.google.com/apis/credentials) Client ID and Client Secret for your app.

### Installing

Navigate into the home directory, install the gems, and setup a local database:
```
$ cd sweater_weather
$ bundle install
$ rails db:create
$ rails db:migrate
```

Create an `application.yml` file using Figaro, then open it for editing. The file is git-ignored, so it may not show up in your GUI.
```
$ bundle exec figaro install
$ (open in your text editor) config/application.yml
```

Add your Google OAuth credentials to `application.yml` file using the syntax shown:
```YML
GOOGLE_CLIENT_ID: your_client_id
GOOGLE_CLIENT_SECRET: your_client_secret
```

Ensure all tests are passing.
```
$ bundle exec rspec
=> .................

=> Finished in 0.80712 seconds (files took 1.79 seconds to load)
=> 17 examples, 0 failures

=> Coverage report generated for RSpec to /news_app_fe/coverage. 384 / 400 LOC (96.0%) covered.
```

You will also need to install the [SpinSpot back end](https://github.com/stevenjames-turing/consultancy_news_BE) in a separate local repository, or use the [currently deployed version](https://news-app-be.herokuapp.com) of it in order to start sending requests and displaying results.

## Requests and Responses

The front end consumes information from the back end service via one `GET` endpoint that includes a topic keyword, for example:
```
/api/v1/news?keyword=biden
```
The JSON response will follow this format:
```JSON
{
  "topic": "biden",
  "type": "articles",
  "data": {
    "left_article": {
      "title": "Biden is Cool!",
      "summary": "Top Ten reasons why we LOVE Joe Biden...",
      "source": "MSNBC",
      "url": "http://msnbc.com/biden-rules",
      "photo_url": "http://msnbc.com/biden-rules/image.jpg"
    },
    "center_article": {
      "title": "Joe Biden: Human",
      "summary": "We take a closer look at the personhood of the 46th president...",
      "source": "Associated Press",
      "url": "http://ap.com/biden-is-a-human",
      "photo_url": "http://ap.com/biden-is-a-human/image.jpg"
    },
    "right_article": {
      "title": "Biden is Coming for your Children",
      "summary": "Lock your doors! Load your guns! Hide your babies...",
      "source": "Fox News",
      "url": "http://fox-news.com/biden-sux",
      "photo_url": "http://faux-newz.com/biden-is-evil/image.jpg"
    }
  }
}

```

## Article Selection

Each topic search will return one article from the "left", "center" and "right" areas of the political spectrum, according to this chart:
![image](https://user-images.githubusercontent.com/91342410/167652605-0870841d-9e21-4617-9386-f121891ad54b.png)

The order of the articles is randomized in order to allow the reader to view them without any expectations.


<p align="right">(<a href="#top">back to top</a>)</p>

## Contributors

- [Blake Dempsey](https://github.com/bdempsey864)<br>
- [Tamara Dowis](https://github.com/wanderlust-create)<br>
- [Mark Ertmer](https://github.com/markertmer)<br>
- [Steven James](https://github.com/stevenjames-turing)<br>
- [Paul Leonard](https://github.com/pleonar1)<br>
- [Ruben Pasillas](https://github.com/hobbiathan)<br>
<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

Please [contact me](https://github.com/markertmer) if you are interested in contributing to this API.

## License

All rights reserved. But feel free to make a copy and make it yours!

## Acknowledgements

 - This project was completed as part of the Module 3 curriculum in the  [Back End Engineering Program](https://backend.turing.edu/) at **[Turing School of Software and Design](https://turing.edu/)**.
 - It was submitted on April 22, 2022 and received a passing grade from instructor [Jamison Ordway](https://github.com/jamisonordway).
 - The project was built to the specification of [these requirements](https://backend.turing.edu/module3/projects/consultancy/)
