<div id="top"></div>

# SPINSPOT

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li>
      <a href="#api-info">API Info</a>
      <ul>
        <li><a href="#consumed">Consumed</a></li>
        <li><a href="#exposed">Exposed</a></li>
      </ul>
    </li>
    <li><a href="Contributors">Contributors</a></li>
  </ol>
</details>

## About The Project

- In an age of information overload, it's getting harder to trust the news. ANY news. A story breaking halfway around the world passes through reporters, editors, network executives, CEOs, and other stakeholders before it ever reaches your eyeballs. We may never know the whole truth, but learning to spot the motives behind the way a story is told can help us to get closer to it. We're not saying one news outlet is "better" or "worse" than any other; that's for you to decide. SPINSPOT is here for one thing: To show the differences in reporting, empowering readers to make up their own mind about the news. We are here for you to SPOT the SPIN in your daily news.
- This project mimics a service-oriented architecture where the back-end is responsible for consuming external API's and making the information avaiable by request to users through our front-end through our own API.
- Check out the Front-End at the [SPINSPOT Front-End Repo](https://github.com/markertmer/news_app_fe)
- Both repositories are accessible through Heroku:
  - [Heroku Link - SPINSPOT BE](https://news-app-be.herokuapp.com/)
  - [Heroku Link - SPINSPOT FE](https://news-app-fe.herokuapp.com/)
- [Turing Project Page](https://backend.turing.edu/module3/projects/consultancy/)
<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

1. Fork and Clone the repo: [GitHub - markertmer/news_app_fe](hhttps://github.com/markertmer/news_app_fe)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Get Mediastack API key [here](https://mediastack.com/)
5. Get TLDRThis API key [here](https://rapidapi.com/tldrthishq-tldrthishq-default/api/tldrthis/)
6. Setup Figaro: `bundle exec figaro install`
7. Add API keys to `config/application.yml`
 -
    ```
    mediastack_key: <put_your_key_here>
    tldr_key: <put_your_key_here>
    ```
<p align="right">(<a href="#top">back to top</a>)</p>

## Built With:

- Framework: Ruby on Rails
  - Versions
    - Ruby: 2.7.4
    - Rails: 5.2.6
- Database: PostgreSQL
- Other tech used:
  - CircleCI
  - Postman
  - RSpec
<p align="right">(<a href="#top">back to top</a>)</p>

## API Info:

  ### Consumed:
  - Mediastack
    - Used to retrieve news articles by passing sources and keywords to available endpoints.
    - Endpoints Used:
      - Live News: `get http://api.mediastack.com/v1/news`
      - Sources: `get http://api.mediastack.com/v1/sources`
  - TLDRThis
    - Used to parse news articles by providing source-link and returns a summary of original article
    - Endpoints Used:
      - Human-like Article Summarization: `post https://tldrthis.p.rapidapi.com/v1/model/abstractive/summarize-url/`
      - Extractive Article Summarization: `post https://tldrthis.p.rapidapi.com/v1/model/extractive/summarize-url/`

  ### Exposed:
  - SPINSPOT
    - Available Endpoints:
      - `get: /api/v1/news?keyword=<search_params>`
    - Example Response:

      - <img src="https://user-images.githubusercontent.com/91357724/164321651-108608a6-ecd4-4173-9c86-5912f10fcd6e.png" alt="Example Response">

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributors

- [Blake Dempsey](https://github.com/bdempsey864)<br>
- [Mark Ertmer](https://github.com/markertmer)<br>
- [Paul Leonard](https://github.com/pleonar1)<br>
- [Ruben Pasillas](https://github.com/hobbiathan)<br>
- [Steven James](https://github.com/stevenjames-turing)<br>
- [Tamara Dowis](https://github.com/wanderlust-create)<br>
<p align="right">(<a href="#top">back to top</a>)</p>
