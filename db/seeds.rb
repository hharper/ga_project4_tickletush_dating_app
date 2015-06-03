# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create
# [
#   (user_id: 11, email: "abc@aol.com"),
# (user_id: 12, email: "def@aol.com"),
# (user_id: 13, email: "ghi@aol.com"),
# (user_id: 14, email: "jkl@aol.com"),
# (user_id: 15, email: "mno@aol.com"),
# (user_id: 16, email: "pqr@aol.com")
#   ]


Profile.create(user_id:2, name:"Henry", photo_url: "http://henrycavill.org/images/FanArt/Edits/RedCarpets/Henry-Cavill-Immortals-premiere-9.jpg", city:"Banjar", interests:"In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.", about_me:"sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et")

Profile.create(user_id:3, name:"Gary", photo_url: "http://invisibledisabilities.org/wp-content/uploads/2011/04/GaryBusey.jpg", city:"Benzilan", interests:"Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.", about_me:"nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros")

Profile.create(user_id:4, name:"Laura", photo_url: "http://www.laineygossip.com/Content/images/articles/laura%20dern%2016jan12%2007.jpg", city:"Rawang", interests:"Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.", about_me:"odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet")

Profile.create(user_id:5, name:"Jane", photo_url: "https://speakerdata.s3.amazonaws.com/photo/image/817319/515501-1317252.jpg", city:"Kotabaru", interests:"Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.",about_me:"sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend")

Profile.create(user_id:6, name:"Paula", photo_url: "http://img2.timeinc.net/people/i/2006/celebdatabase/paulaabdul/paula_abdul1_300_400.jpg", city:"Padabeunghar", interests:"Praesent blandit lacinia erat.",about_me:"magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id")

Profile.create(user_id:7, name:"Laurence", photo_url: "http://ia.media-imdb.com/images/M/MV5BMTc0NjczNDc1MV5BMl5BanBnXkFtZTYwMDU0Mjg1._V1_SX640_SY720_.jpg", city:"Santa Cruz De Tenerife", interests:"Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.", about_me:"tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris")
