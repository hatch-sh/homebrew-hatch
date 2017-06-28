# homebrew-hatch

This is the Homebrew formula for [hatch][hatch].

## Updating the Homebrew formula

The current process for updating the Homebrew formula is very manual.

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
