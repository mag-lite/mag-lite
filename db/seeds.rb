# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new({
  name: 'Hector Admin',
  email: 'hector@admin.com',
  password: 'password'
})
admin.group_slug = 'admin'
admin.save!

User.create!({
  name:         'Jake Student',
  email:        'jake_the_snake@gmail.com',
  password:     'password',
  heard_from:   'Bartholomew Simpson',
  target_score: 320
})
User.create!({
  name:         'Isabella Student',
  email:        'dizzyizzy@yahoo.com',
  password:     'password',
  target_score: 330,
  actual_score: 318
})
User.create!({
  name:         'Joe Six-Pack',
  email:        'joesixpack@gmail.com',
  password:     'password',
  target_score: 320,
  actual_score: 292
})

[
  {
    name: "Intro to Mag-Lite",
    description: "Overview of website and resources",
    video: {
      url: 'http://dxdo2x6i0ocgk.cloudfront.net/dede92e8b7f0336a021237d31cd27e25eee639b7-video-959/web.mp4',
      length: 363
    }
  },
  {
    name: "What's on the GRE?",
    description: "Structure and format of the official GRE",
    video: {
      url: 'http://dxdo2x6i0ocgk.cloudfront.net/dede92e8b7f0336a021237d31cd27e25eee639b7-video-959/web.mp4',
      length: 363
    }
  },
  {
    name: "Scoring Range",
    description: "Learn what your scores mean",
    video: {
      url: 'http://dxdo2x6i0ocgk.cloudfront.net/dede92e8b7f0336a021237d31cd27e25eee639b7-video-959/web.mp4',
      length: 363
    }
  },
  {
    name: "Math Section Breakdown",
    description: "High-level strategy and study tips",
    video: {
      url: 'http://dxdo2x6i0ocgk.cloudfront.net/dede92e8b7f0336a021237d31cd27e25eee639b7-video-959/web.mp4',
      length: 363
    }
  },
  {
    name: "Verbal Section Breakdown",
    description: "High-level strategy and study tips",
    video: {
      url: 'http://dxdo2x6i0ocgk.cloudfront.net/dede92e8b7f0336a021237d31cd27e25eee639b7-video-959/web.mp4',
      length: 363
    }
  },
  {
    name: "Test Day",
    description: "What to expect on the big day",
    video: {
      url: 'http://dxdo2x6i0ocgk.cloudfront.net/dede92e8b7f0336a021237d31cd27e25eee639b7-video-959/web.mp4',
      length: 363
    }
  }
].each_with_index do |attrs, i|
  video_attrs = attrs.delete :video

  lesson = Lesson.new(attrs.merge({
    display_order: (i + 1),
    published: true
  }))
  lesson.uploader = admin
  lesson.save!

  video = lesson.videos.build(video_attrs)
  video.author = admin
  video.save!
end
