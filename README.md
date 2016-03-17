[![Gem Version](https://badge.fury.io/rb/metaa.png)](http://badge.fury.io/rb/metaa)
[![Build Status](https://travis-ci.org/anhkind/metaa.png)](https://travis-ci.org/anhkind/metaa)
[![Code Climate](https://codeclimate.com/github/anhkind/metaa/badges/gpa.svg)](https://codeclimate.com/github/anhkind/metaa)

# Metaa: meta tags with ease

Metaa adds meta tags to your Rails application with ease.

With Metaa, you can easily add meta tags to your current model with simple DSL, then render these tags on your views with a single method.

## Installation

Add Metaa to your Gemfile:

    gem 'metaa'
    
## Generator

The command is simple, just add the model you want to create the meta for:

```
rails generate meta Product
```

This will generate `ProductMeta` meta class in your app/meta folder.

```ruby
# app/meta/product_meta.rb
class ProductMeta < Metaa::Meta
  def define_meta
    # Define meta tags of your record here.
    # Each definition will require a hash for the meta attributes, for example:
    # meta name:    "title",
    #      content: object.title # you can access the record through 'object' variable

  end
end
```

## Meta definition

We can define the meta tags as following:

```ruby
# app/meta/product_meta.rb
class ProductMeta < Metaa::Meta
  def define_meta
    meta name:    "title",
         content:  object.title
        
    # You can define multiple meta tags in order
    meta name:    "description",  
         content:  object.description
  end
end
...

product.title       #=> "product title"
product.description #=> "product description"

# access to the rendered html
product.meta_tags   #=> "<meta content=\"product title\" name=\"title\" /><meta content=\"product description\" name=\"description\" />"
```

All ActiveRecord instances will have this behavior if appropriate meta class is defined, e.g. `ProductMeta` for model `Product`.

## Non ActiveRecord

With non ActiveRecord instances, you can still generate the meta class and define the meta tags normally with any class name. However, you have to handle the meta object manually:

```ruby
# app/meta/non_active_record_model_meta.rb
class NonActiveRecordModelMeta < Metaa::Meta
  def define_meta
    meta name:    "title",
         content: object.title

  end
end
...

ruby_object.title  #=> "a title"

# create meta object from ruby_object
meta_object = NonActiveRecordModelMeta.new(ruby_object)

# access to the rendered html
meta_object.to_html #=> "<meta content=\"a title\" name=\"title\" />"
```

Notice that we use `meta_tags` method on ActiveRecord instances instead of `to_html` method on the meta objects in order to avoid method name conflicts on your models.

## License
MIT

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
