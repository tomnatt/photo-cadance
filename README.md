# Photo analysis

Looking at the frequency I take photographs by looking at the files I've got on my hard drive, and photos posted to Instagram. Generated the data to support [this blog post](https://tomnatt.blogspot.com/2018/12/mental-health-and-maths.html) via [this basic analysis](https://docs.google.com/spreadsheets/d/1dkXr75l3aKn4SPEOlJxaWhFUSIeGm1p8-O9xHlTsQ9c/edit?usp=sharing).

## How to run

Assuming you have a working ruby 2.5.1 environment and installed bundler. The ruby version is not a requirement - edit `.ruby-version` if you have problems.

Check out the code, then run `bundle install`.

To run the file analysis:
```
PHOTO_DIR=<mydir> bundle exec ruby photo_file.rb
```
Where mydir is the directory containing your photographs from 2018. It will not separate by year.

To run the Instagram analysis:
```
INSTAGRAM_ACCESS_TOKEN=<mytoken> bundle exec ruby instagram.rb
```

To run the two year Instagram analysis:
```
INSTAGRAM_ACCESS_TOKEN=<mytoken> bundle exec ruby instagram_two_years.rb
```
To get an instagram access token there are various sites which will offer to do the oauth exchange for you - just search for `instagram access token`. Whether you trust those sites or not is up to you.
