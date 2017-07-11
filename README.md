# homebrew-hatch

This is the Homebrew formula for [hatch][hatch].

## Updating the Homebrew formula

The current process for updating the Homebrew formula is very manual.

### Testing recipe locally

    brew tap hatch-sh/hatch
    brew edit hatch
    # copy the contents from your current recipe
    brew install hatch

### Updating hatch version

After having released a new version to pypi you have to change the link
in `hatch.rb` and update the sha256 value.

    curl -O https://pypi.python.org/packages/04/15/a60f8a9fda0cd4d261cd035e3988d43369b2779ff619da6fbcef8b707211/hatch-cli-0.0.1b5.tar.gz
    shasum -a 256 hatch-cli-0.0.1b4.tar.gz
    rm hatch-cli-0.0.1b4.tar.gz

### Updating pip dependencies

This is the most tedious part. For each pip dependency we have to generate a
resource stanzas. The list can be generated like this:

    python -m pip install virtualenvwrapper
    source $(brew --prefix)/bin/virtualenvwrapper.sh
    mktmpenv
    pip install git+https://github.com/mads-hartmann/hatch.git@TAG
    pip install homebrew-pypi-poet
    poet hatch-cli > dependencies.txt

And then the stanzas from `dependencies.txt` should be copied into the formula.

[hatch]: https://github.com/hatch-sh/hatch
