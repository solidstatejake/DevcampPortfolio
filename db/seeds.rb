# frozen_string_literal: true

# Sample topic data
3.times do |topic|
  Topic.create!(
  title: "Topic #{topic}"
  )
end

puts '3 Topics created'

# Sample blog data
10.times do |blog|
  Blog.create!(
  title:    "My Blog Post #{blog + 1}",
  body:     "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
 Accusantium cum distinctio dolore, dolores earum fuga labore magni natus, optio
 praesentium ratione rem velit! Ad amet at atque autem, beatae commodi dicta
 distinctio ea eos ex impedit ipsam ipsum labore nam officiis pariatur quasi,
 quia quis quos similique ut velit vero voluptatum! Accusamus adipisci aliquam
 asperiores aspernatur cupiditate dolore, est et eum excepturi facere fugiat
 incidunt libero maxime mollitia neque nobis officia pariatur possimus
 praesentium quasi quia quis reiciendis sint, soluta unde vel voluptatem
 voluptatum! A, asperiores aspernatur debitis, dolor ex fugit illo in ipsam,
 nisi numquam quidem reiciendis sunt veritatis.",
  topic_id: Topic.last.id
  )
end

# Sample skills data
puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
  title:            "Rails #{skill + 1}",
  percent_utilized: 5 * (skill + 1)
  )
end

puts '5 skills created'

# Sample portfolio data
8.times do |portfolio_item|
  Portfolio.create!(
  title:       "Portfolio title: #{portfolio_item + 1}",
  subtitle:    'Ruby on Rails',
  body:        "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  Debitis dicta hic iure perspiciatis possimus repellat sed. A accusantium,
  consectetur consequuntur cumque cupiditate deleniti deserunt dolorum eaque eos
  esse est et ex fugiat illo magnam, molestias, nam neque omnis pariatur quas qui
  saepe sed sit soluta tempora tenetur totam voluptatum. Asperiores?",
  main_image:  'https://placehold.it/600x400',
  thumb_image: 'https://placehold.it/350x200'
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
  title:       "Portfolio title: #{portfolio_item + 1}",
  subtitle:    'Angular',
  body:        "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
  Debitis dicta hic iure perspiciatis possimus repellat sed. A accusantium,
  consectetur consequuntur cumque cupiditate deleniti deserunt dolorum eaque eos
  esse est et ex fugiat illo magnam, molestias, nam neque omnis pariatur quas qui
  saepe sed sit soluta tempora tenetur totam voluptatum. Asperiores?",
  main_image:  'https://placehold.it/600x400',
  thumb_image: 'https://placehold.it/350x200'
  )
end

# end sample portfolio data

puts '9 portfolio items created'

# Sample technology data
3.times do |technology|
  Portfolio.last.technologies.create!(
  name: "Technology #{technology + 1}"
  )
end

puts '3 technologies created'

# end sample technology data

# Sample user data
5.times do |user|
  User.create!(
  email: "email#{user + 1}@domain.com",
  password: "password",
  name: "First#{user + 1} Last#{user + 1}",
  sign_in_count: 0,
  )
end

puts '5 users created'

# end sample technology data