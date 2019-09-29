Simple Uptime Robot Dashing widget

## Description

[Dashing](http://shopify.github.com/dashing) widget to display a short list of [Uptime Robot](http://uptimerobot.com/) monitors. 
This version is compatible with the current Uptime Robot APIv2 (https://uptimerobot.com/api).

##Usage

Add this to your Gemfile and run `bundle install`:
```bash
gem 'uptimerobot'
```

The files `uptimerobot.coffee`, `uptimerobot.html` and `uptimerobot.scss` go in the `/widget/uptimerobot` directory.

The `uptimerobot.rb` goes into the `/jobs` directory.

Put the following in your dashboard.erb file to make it show up in your dashboard:

    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="uptimerobot" data-view="Uptimerobot"></div>
    </li>


##Settings (`uptimerobot.rb`)

You will need to provide an API key from [Uptime Robot API](http://uptimerobot.com/api)