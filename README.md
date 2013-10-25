[![Build Status](https://travis-ci.org/anhkind/metaa.png)](https://travis-ci.org/anhkind/metaa)

# Metaa: meta tags with ease

Metaa adds meta tags to your Rails application with ease.

With Metaa, you can easily add meta tags to your current model with simple DSL, then render these tags on your views with a single method.

## Generator

The command is simple, just add the model you want to create the meta for:

```
rails generate meta Product
```

This will generate `ProductMeta` meta class in your app/meta folder.

## Meta definition

After generated, the meta class will look like this:

```
# app/meta/product_meta.rb
class ProductMeta < Metaa::Meta
  def define_meta
    # Define meta tags of your record here. Each definition will require a hash for the meta attributes,
    #  and each attribute can be a string, symbol or lambda/proc, for example:
    # meta name:    "title",
    #      content: object.title # you can access the record through 'object' variable

  end
end
```

You can define meta tags multiple times and these tags will be displayed in the order you define in meta class.

To access to the rendered html, just use method `meta_tags` on your ActiveRecord instance:

```
product.meta_tags
```
All ActiveRecord instances will have this behavior if appropriate meta class is defined, e.g. `ProductMeta` for model `Product`.

## Non ActiveRecord

With non ActiveRecord instances, you can still generate the meta class and define the meta tags normally with any class name. However, you have to handle the meta object manually:

```
# app/meta/non_active_record_model_meta.rb
class NonActiveRecordModelMeta < Metaa::Meta
  def define_meta
    meta name:    "title",
         content: object.title

  end
end

...

ruby_object.respond_to? :title #=> true

...

# create meta object from ruby_object
meta_object = NonActiveRecordModelMeta.new(ruby_object)

# access rendered html of the defined meta tags
meta_object.html
```

## Installation

Add Metaa to your Gemfile:

    gem 'metaa'

And run bundle install within your app's directory.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
