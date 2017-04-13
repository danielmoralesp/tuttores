// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

jQuery(function() {
  var cities;
  cities = $('#teacher_city_id').html();
  console.log(cities);
  return $('#teacher_country_id').change(function() {
    var country, options;
    country = $('#teacher_country_id :selected').text();
    options = $(cities).filter("optgroup[label=" + country + "]").html();
    console.log(options);
    if (options) {
      return $('#teacher_city_id').html(options);
    } else {
      return $('#teacher_city_id').empty();
    }
  });
});

jQuery(function() {
  var cities;
  cities = $('#tutoring_city_id').html();
  console.log(cities);
  return $('#tutoring_country_id').change(function() {
    var country, options;
    country = $('#tutoring_country_id :selected').text();
    options = $(cities).filter("optgroup[label=" + country + "]").html();
    console.log(options);
    if (options) {
      return $('#tutoring_city_id').html(options);
    } else {
      return $('#tutoring_city_id').empty();
    }
  });
});

jQuery(function() {
  var topics;
  topics = $('#tutoring_topic_id').html();
  console.log(topics);
  return $('#tutoring_subject_id').change(function() {
    var subject, options;
    subject = $('#tutoring_subject_id :selected').text();
    options = $(topics).filter("optgroup[label=" + subject + "]").html();
    console.log(options);
    if (options) {
      return $('#tutoring_topic_id').html(options);
    } else {
      return $('#tutoring_topic_id').empty();
    }
  });
});

jQuery(function() {
  var topics;
  topics = $('#service_topic_id').html();
  console.log(topics);
  return $('#service_subject_id').change(function() {
    var subject, options;
    subject = $('#service_subject_id :selected').text();
    options = $(topics).filter("optgroup[label=" + subject + "]").html();
    console.log(options);
    if (options) {
      return $('#service_topic_id').html(options);
    } else {
      return $('#service_topic_id').empty();
    }
  });
});

jQuery(function() {
  var topics;
  topics = $('#test_topic_id').html();
  console.log(topics);
  return $('#test_subject_id').change(function() {
    var subject, options;
    subject = $('#test_subject_id :selected').text();
    options = $(topics).filter("optgroup[label=" + subject + "]").html();
    console.log(options);
    if (options) {
      return $('#test_topic_id').html(options);
    } else {
      return $('#test_topic_id').empty();
    }
  });
});
