## FAQ

*   *Where can I get help?*

    Mail us at [admin@software-carpentry.org](mailto:admin@software-carpentry.org),
    or join our [discussion list](http://lists.software-carpentry.org/mailman/listinfo/discuss_lists.software-carpentry.org)
    and ask for help there.

*   *Where can I report problems or suggest improvements?*

    Please file an issue against [https://github.com/swcarpentry/workshop-template](this repository)
    or [mail us](mailto:admin@software-carpentry.org).

*   *Why does the workshop repository have to be created from scratch? Why not fork `workshop-template` on GitHub?*

    Because any particular user can only have one fork of a repository,
    but instructors frequently need to work on several workshops at once.

*   *Why use Jekyll?  Why not some other markup language and some other converter?*

    Because it's the default on GitHub.  If we're going to teach
    people to use that site, we should teach them to use it as it is,
    not as we wish it was.

*   *Where should pages go if multiple workshops are running at a site simultaneously?*

    Use subdirectories like `2015-07-01-esu/beginners`, so that main
    directory names always follow our four-part convention.

*   *What if I want to add more values to the page, like `address1` and `address2` for different rooms on different days?*

    Go ahead, but you *must* have 
    [the variables described above](#variables).

*   *What is the "Windows installer"?*

    We have built a small installation helper for Windows that
    installs `nano` and `sqlite`, adds R to the path, and so on.  It
    is maintained in
    [https://github.com/swcarpentry/windows-installer](https://github.com/swcarpentry/windows-installer),
    which also has an up-to-date description of what it actually does.
    The latest version is always available at
    [http://files.software-carpentry.org/SWCarpentryInstaller.exe](http://files.software-carpentry.org/SWCarpentryInstaller.exe),
    and contributions are always welcome.

## Debugging

*   *What do I do if I see a `invalid byte sequence in ...` error when I run `tools/check`?*

    Declare the `en_US.UTF-8` locale in your shell:

    ~~~
    $ export LC_ALL=en_US.UTF-8
    $ export LANG=en_US.UTF-8
    ~~~

*   *What do I do if I see a `Conversion error` when I run `tools/check`?*

    The error message may look something like this:

    ~~~
    Configuration file: d:/OpenCourses/swc/2013-10-17-round6.4/_config.yml
            Source: d:/OpenCourses/swc/2013-10-17-round6.4
       Destination: _site
      Generating... c:/Ruby193/lib/ruby/gems/1.9.1/gems/posix-spawn-0.3.6/lib/posix/spawn.rb:162: wa
    rning: cannot close fd before spawn
    Conversion error: There was an error converting 'lessons/misc-biopython/fastq.md'.
    done.
    ~~~

    This is a [problem in Pygments.rb](http://stackoverflow.com/questions/17364028/jekyll-on-windows-pygments-not-working).
    Uninstall pygments.rb 0.5.1 or 0.5.2, install 0.5.0.  For example, here's how you would
    uninstall pygments 0.5.2 and restore version 0.5.0:

    ~~~
    $ gem uninstall pygments.rb --version "=0.5.2"
    $ gem install pygments.rb --version "=0.5.0"
    ~~~

*   *What do I do if I get a "can't convert nil into String" error?

    On some Linux distributions (e.g, Ubuntu 14.04), you may get this error:

    ~~~
    $ ./tools/preview 
    /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in `require': iconv will be deprecated in the future, use String#encode instead.
    /usr/lib/ruby/1.9.1/time.rb:265:in `_parse': can't convert nil into String (TypeError)
	    from /usr/lib/ruby/1.9.1/time.rb:265:in `parse'
	    from /usr/bin/jekyll:95:in `block (2 levels) in <main>'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1391:in `call'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1391:in `block in parse_in_order'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1347:in `catch'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1347:in `parse_in_order'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1341:in `order!'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1432:in `permute!'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1453:in `parse!'
	    from /usr/bin/jekyll:137:in `<main>'
    ~~~

    This occurs because you are using an old version of Jekyll located in `/usr/bin`.
    Make sure that you have installed Jekyll using:

    ~~~
    $ gem install jekyll
    ~~~

    This installs Jekyll in `/usr/local/bin`,
    so make sure this directory comes before `/usr/bin` in your `PATH` environment variable,
    so that:

    ~~~
    $ which jekyll
    /usr/local/bin/jekyll
    ~~~

    You may also have to install the `nodejs` package to disable references to JavaScript,
    which you can do using:

    ~~~
    $ sudo apt-get install nodejs
    ~~~

    For more information, see
    [http://michaelchelen.net/81fa/install-jekyll-2-ubuntu-14-04/](this article).
