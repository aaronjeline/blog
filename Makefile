
site: gen_posts pages


pages:
	cat index_raw.html | m4 > index.html
	cat posts_raw.html | m4 > posts.html



gen_posts: 
	./generate_posts.sh


clean:
	rm -f index.html posts.html posts/*
	rm -f posts_lists.html recent_posts.html

