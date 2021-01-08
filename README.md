# What is CryptoViewer
Cryptoviewer is an iOS app to check the current statistics about the main cryptocurrencies made by contributors under the GPLv3 lisence


Contributing to Cryptoviewer
============================

The Cryptoviewer project operates an open contributor model where anyone is
welcome to contribute towards development in the form of peer review, testing
and patches. This document explains the practical process and guidelines for
contributing.

First, in terms of structure, there is no particular concept of "CryptoViewer
developers" in the sense of privileged people. Open source often naturally
revolves around a meritocracy where contributors earn trust from the developer
community over time. Nevertheless, some hierarchy is necessary for practical
purposes. As such, there are repository "maintainers" who are responsible for
merging pull requests, as well as a "lead maintainer" who is responsible for the
release cycle as well as overall merging, moderation and appointment of
maintainers.

Contributor Workflow
--------------------

The codebase is maintained using the "contributor workflow" where everyone
without exception contributes patch proposals using "pull requests" (PRs). This
facilitates social contribution, easy testing and peer review.

To contribute a patch, the workflow is as follows:

  1. Fork repository 
  1. Create topic branch
  1. Commit patches


### Creating the Pull Request

The title of the pull request should be prefixed by the component or area that
the pull request affects. Valid areas as:

  - `main` for changes to the main app code
  - `doc` for changes to the documentation
  - `log` for changes to log messages
  - `refactor` for structural changes that do not change behavior
  - `test`, `qa` or `ci` for changes to the unit tests, QA tests or CI code

