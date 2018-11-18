# Emacs config

This repo contains all my emacs config files under the folder ```.emacs.d```. Currently, it contains support for the following languages and/or modes:

* Python;
* Javascript;
* Typescript;
* Clojure;
* Ruby;
* Markdown mode;
* HTML, CSS;
* ...more!

# Installing

To install this config, just clone this repo and move the ```.emacs.d``` folder right to your home directory, e.g., to your ```~/``` directory.

Another option is to clone this repo and symlink the ```~/.emacs.d``` folder
of your home directory to the same folder of the cloned repo.

# Updating Packages

To update a package, use ```M-x package-reinstall <pckg name>``` which will update the the ```.emacs.d/elpa``` folder. Then, simply copy the ```.emacs.d```folder and replace the one of this repo and, finally, commit and push!

* Do NOT forget to add compiled-like files such as *.pyc or *.elc (already ignored) to ```.gitignore``` file!

# Debugging LISP errors

Sometimes, errors occurs. the ```init.el``` sets the debug mode to be on. Hence, a stack trace will always be popped up if an error occurs at runtime.

# Treating LISP package errors

This is way too general, but, sometimes, a good approach is to use ```M-x package-delete <pckg name>``` to purge the package from the elpa directory and then run ```M-x package-install <pckg name>```to reinstall the package. Reinstalling the package is also an option.

Next, some common errors that I've encountered so far:

# Python encoding error when Black is formatting:

This error occured in a MacOS system. Black couldn't not format the file properly due to an encoding error.

* Don't forget to export, on .bashrc, to set the following variable which forces applications to use the default language for output:

```LC_ALL=en_US.UTF-8````
