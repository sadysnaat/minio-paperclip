# RoR Resume app using paperclip and minio [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![minio_ROR](https://github.com/sadysnaat/minio-paperclip/blob/master/docs/Screenshot.png?raw=true)

Example Ruby on Rails App that works with a Minio Server. We will use the **paperclip** in our rails app to upload objects to a Minio Server. Full code is available here : https://github.com/sadysnaat/minio-paperclip, released under Apache 2.0 License.

## 1. Prerequisites

* Install mc  from [here](https://docs.minio.io/docs/minio-client-quickstart-guide).
* Install Minio Server from [here](https://docs.minio.io/docs/minio ).
* [ruby 2.0](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems) and above
* [rails 4.0](http://guides.rubyonrails.org/v4.0/)  and above


## 2. Dependencies

* [paperclip](https://github.com/thoughtbot/paperclip)
* [aws-sdk v2.0 gem](https://github.com/aws/aws-sdk-ruby)
* [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)
* [simple_form](https://github.com/plataformatec/simple_form)

## 3. Install

```bash
$ git clone git@github.com:sadysnaat/minio-paperclip.git
$ cd minio-paperclip
$ bundle install
```
## 4. Set Up Bucket

In this example I have used [minio public server](https://play.minio.io:9000) and bucket is **testbucket**. 

If you wish to use another bucket, create a new bucket with the following command. 
```sh
$ mc mb play/new_bucket_name
```

## 5. Configure paperclip defaults to Minio Server

```ruby
# Set default configuration here, if you wish to use different buckets/servers in
# different environments please set configuration in config/environments/ files
# For more details please refer to
# https://github.com/thoughtbot/paperclip#defaults
config.paperclip_defaults = {
  storage: :s3,
  s3_protocol: ':https',
  s3_permissions: 'private',
  s3_region: 'us-east-1',
  s3_credentials: {
    bucket: 'testbucket',
    access_key_id: 'Q3AM3UQ867SPQQA43P2F',
    secret_access_key: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG',
  },
  s3_host_name: 'play.minio.io:9000',
  s3_options: {
    endpoint: "https://play.minio.io:9000", # for aws-sdk
    force_path_style: true # for aws-sdk (required for minio)
  },
  url: ':s3_path_url',
  path: "/:class/:id.:style.:extension"
}
```


## 8. Run The App

```sh

$ rake db:migrate
$ rails s

```
Now if you visit http://localhost:3000 you should be able to see the example application.

