## Twitter-List

![](https://gist.githubusercontent.com/bastibeckr/f0c99d51d3e3c634549d500691464f82/raw/f5cf790aed7080a67bf804364fb28fc188156150/twitter-list.png)

## Description

Shows a list of tweets, basically it can show any list of comments. We use it to display our Twitter account's latest "saved search" - results.

## Dependencies

* [Twitter for Ruby](https://github.com/sferik/twitter): `gem install twitter` (of course only if you want do display tweets.)

## Usage

* Copy `comment_list.html`, `comment_list.coffee`, `comment_list.scss` into the `/widgets/comment_list/` directory.
* Put the file `twitter_search.rb` into the `/jobs/` directory.
* Add your Twitter API credentials to twitter_search.rb
* Customize the twitter-search as needed. E.g. add language, change number of tweets to grab. `tweets = client.search(search+ ' -RT', {result_type: 'recent', lang: 'de' }).take(10)`

Of course you can display any information. Just create a job to fetch the data. Currently, these fields are used:

* `name` The username
* `body` The comment body. Hashtags and twitter-handles (@username) are highlighted by javascript.
* `avatar` The user's avatar
* `time` Creation time of the tweet
* `image` An image can be displayed under the comment.

##Example widget:

~~~
<li data-row="1" data-col="5" data-sizex="1" data-sizey="3">
    <div data-id="twitter_search" data-view="CommentList" ></div>
</li>
~~~





