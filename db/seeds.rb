# Sample blog data
10.times do |blog|
	Blog.create!(
			title: "My Blog Post #{blog + 1}",
			body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
Accusantium cum distinctio dolore, dolores earum fuga labore magni natus, optio
praesentium ratione rem velit! Ad amet at atque autem, beatae commodi dicta
distinctio ea eos ex impedit ipsam ipsum labore nam officiis pariatur quasi,
quia quis quos similique ut velit vero voluptatum! Accusamus adipisci aliquam
asperiores aspernatur cupiditate dolore, est et eum excepturi facere fugiat
incidunt libero maxime mollitia neque nobis officia pariatur possimus
praesentium quasi quia quis reiciendis sint, soluta unde vel voluptatem
voluptatum! A, asperiores aspernatur debitis, dolor ex fugit illo in ipsam,
nisi numquam quidem reiciendis sunt veritatis."
	)
end

# Sample skills data
puts "10 blog posts created"

5.times do |skill|
	Skill.create!(
			 title: "Rails #{skill + 1}",
			 percent_utilized: 5 * (skill + 1)
	)
end

puts "5 skills created"

# Sample portfolio data
9.times do |portfolio_item|
	Portfolio.create!(
					 title: "Portfolio title: #{portfolio_item + 1}",
					 subtitle: "Service #{portfolio_item + 1}",
					 body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
 Debitis dicta hic iure perspiciatis possimus repellat sed. A accusantium,
 consectetur consequuntur cumque cupiditate deleniti deserunt dolorum eaque eos
 esse est et ex fugiat illo magnam, molestias, nam neque omnis pariatur quas qui
 saepe sed sit soluta tempora tenetur totam voluptatum. Asperiores?",
					 main_image: "https://placehold.it/600x400",
					 thumb_image: "https://placehold.it/350x200"
	)
end

puts "9 portfolio items created"