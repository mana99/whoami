

Simple experiment with the [XSLT](https://en.wikipedia.org/wiki/XSLT) [template processing](https://en.wikipedia.org/wiki/Template_processor) model by [W3C](https://www.w3.org/) to build a static web page containing résumé informations.

The data model is contained in `darth.xml`, while the source template is in `template.xslt` and the CSS stylesheet and other media in the `static/` folder.

In GNU/Linux, generate the HTML page using the XSLT template engine:

``` bash
xsltproc darth.xml > build/index.html 
```

and copy the static files with:

``` bash
cp -r static/* build/
```

or simply call the `build.sh` script. 

The rendered web page can be found at https://dvader.surge.sh.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/wxL8bVJhXCM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
