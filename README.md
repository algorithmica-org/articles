# Algorithmica.org — Contribution FAQ - AN DYNAMIC PROJECT

**Q: I found a small bug/typo and I want to fix it. How can I do it?**

Login to GitHub, go to `src/<lang>/<broken_article>.md`, click "Edit", correct the error, press "commit" and create a tiny pull request. Someone will soon review and approve it.

**Q: How to contribute an article?**

If you want to contribute something more than just a bugfix, we advise cloning the repository and editing it locally.

You just need to add a new markdown file in `src` directory. We recommend using specialized editors like [MarkText](https://marktext.app/), but you can use whatever you want as long as it complies with standard markdown syntax.

It would be really great if you also checked how it will actually be displayed. To build the entire website, install [Pandoc](https://pandoc.org/), run `build.sh` and wait for ~10 seconds. The articles will be compiled into `web` directory, just find `<your_article>.html` there.

Once your pull request is merged into master, it will be automatically deployed to the web.

**Q: May I use these articles somewhere else?**

Sure, everything is published under Creative Commons. You can use it wherever you want, even commercially, but please provide a link to original post.

*Note that some articles include diagrams borrowed from external resources. Since they aren't ours, we can't give you permission to use them.
Other than that you can use any articles.*
