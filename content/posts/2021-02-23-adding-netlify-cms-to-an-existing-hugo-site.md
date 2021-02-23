---
layout: blog
title: Adding Netlify CMS to an existing Hugo Site
date: 2021-02-23T18:37:30.365Z
---
I built this web site with Hugo and host it on Netlify. I use Visual Studio Code to make all the editing on my local repository and push to/pull from my remote repository on GitHub. I'm a beginner so this process helped me alot to learn the basic of Markdown and Git. It's fun to update the website content following these steps but sometimes it can be frustrating. At those times I really miss the user interface of content management systems such as Wordpress. 

I recently learned that it is possible to integrate [frontend interfaces with a Hugo Website](https://gohugo.io/tools/frontends/). I tried to integrate Netlify CMS with my website since I already use Netlify services. 

There is detailed explanation about [how to set up Netlify CMS on an existing Hugo website](https://www.netlifycms.org/docs/add-to-your-site/) or [starting with a template](https://www.netlifycms.org/docs/start-with-a-template/). I tried the "start with a template" option and it worked smoothly, but it creates the website with a built in theme and I couldn't manage to change the theme after building the web site. Besides, I already have a static web site built with Hugo and I want to integrate a CMS with it. It took some time for me to understand the whole process, that's why I decided to note each step here in case if I forget it again :)

Step 1: Create a folder called `admin` inside the `static` folder in your local repository.

Step 2: Inside the `admin` folder, create two files: `index.html` and `config.yml` . The first file `admin/index.html` is an entry point to Netlify CMS. You will access the CMS interface from `yourwebsite.com/admin` (in my case it is `naimcinar.com/admin/`) when everyhing is ready. 