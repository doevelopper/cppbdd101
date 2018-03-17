# Contribution Guidelines

First of all, thanks for thinking of contributing to this project!
This project has a [Contributor Covenant Code of Conduct](./CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
Please ensure your pull request adheres to the following guidelines:

- Alphabetize your entry.
- Search previous suggestions before making a new one, as yours may be a duplicate.
- Suggested READMEs should be beautiful or stand out in some way.
- Make an individual pull request for each suggestion.
- New categories, or improvements to the existing categorization are welcome.
- Keep descriptions short and simple, but descriptive.
- Start the description with a capital and end with a full stop/period.
- Check your spelling and grammar.
- Make sure your text editor is set to remove trailing whitespace.

## How to contribute to the project
Found a bug in our code, or have an idea for a feature? Here are some notes on
how to best report them so we can get it fixed as quickly as possible.

## Security Issues

***Any security issues should be submitted directly to
<security@travis-ci.org>***

In order to determine whether you are dealing with a security issue, ask
yourself these two questions:

1. Can I access something that's not mine, or something I shouldn't have access
   to? 
2. Can I disable something for other people?

If the answer to either of those two questions are "yes", then you're probably
dealing with a security issue. Note that even if you answer "no" to both
questions, you may still be dealing with a security issue, so if you're unsure,
just email us at <happyman@hotmail.fr>.

## Build Failures

Please note that our issue tracker's main purpose is to track bugs for Travis CI.
If your build is passing locally, but not on Travis CI, please make sure that it's
an issue with Travis before reporting it.

Some frequent reasons for builds failing on Travis CI:

- 3rd party dependencies missing
- Minor differences between OS X and Linux (such as whether the filesystem is
  case-sensitive or not).

A good place to ask for advice when your build is failing on Travis CI is
[the project tag on Wiki](http://documentations.tbd.acme/questions/tagged/travis-ci).

## Other Issues

Found a bug in ? Here are some notes on how to report the bug so we
can fix it as fast as possible:

- Explain, as detailed as possible, how to reproduce the issue.
- Include what you expected to happen, as well as what actually happened.
- If it's a bug with the website, please include information on what browser
  version and operating system you are running.
- If it helps, feel free to [attach a
  screenshot](https://github.com/blog/1347-issue-attachments) or video
  illustrating the issue.
- If you're having trouble with a specific build, please include a link to the
  build or job in question.
- Include all this information in a new issue on our [Issue Tracker](https://github.com/doevelopper/cppbdd101/issues)

## ❤️ Ways to Contribute

* Blog or tweet about the project
* Improve documentation
* Fix a bug
* Implement a new feature
* Discuss potential ways to improve project
* Improve existing implementation, performance, etc.

## Submitting a pull request

1. [Fork][fork] and clone the repository
2. Configure and install the dependencies: ` See Requirements sections`
3. Make sure the tests pass on your machine: `make test`
4. Create a new branch: `git checkout -b my-branch-name`
5. Make your change, add tests, and make sure the tests still pass
6. Push to your fork and [submit a pull request][pr]
7. Pat your self on the back and wait for your pull request to be reviewed and merged.

## 🛎 Questions

Feel free to open a ticket with your question.

Please put some effort in requesting a new feature. If someone else is going to implement something, the least you can do is describe the feature in detail, and why it would be useful to others as well.

## 🐛 File a Bug

In case you've encountered a bug, please make sure:

* You are using the [latest version](https://github.com/webpro/release-it/releases).
* You have read the [documentation](https://github.com/webpro/release-it/blob/master/README.md) first, and double-checked your configuration.
* You have acknowledged from `--verbose` and `--debug` the errors are likely a bug in this project (and not coming from your environment or a dependency of this project).
* In your issue description, please include:
	* What you expected to see, and what happened instead.
	* Your operating system and other environment information.
	* As much information as possible, such as the command and configuration used.
	* Interesting logs with `--verbose` and/or `--debug`.
	* All steps to reproduce the issue.

## 🎁 Pull Requests

Pull requests are welcome! Please keep the following in mind:

* See below for instructions on how to set up the project on your machine.
* To match the existing code styling, use `cmake --build build --target verify` before committing code.
* Make sure the tests pass (run `cmake --build build --target integration-test`). Your changes probably deserve new tests as well.
* Remember that this project is cross-platform compatible (macOS, Windows, Linux), and that it runs in different versions of Node.

Unsure about whether you should open a pull request? Feel free to discuss it first in a ticket.

Know how to fix something? We love pull requests! Here's a quick guide:

1. [Check for open issues](https://github.com/travis-ci/travis-ci/issues), or
   open a fresh issue to start a discussion around a feature idea or a bug.
   Opening a separate issue to discuss the change is less important for smaller
   changes, as the discussion can be done in the pull request.
2. Fork the relevant repository on GitHub, and start making your changes.
   Set up the project on your machine:
   ```bash
        git clone git@github.com:<>.git
        cd <>
        cmake --build build --target verify
   ```
3. Check out the README for the project for information specific to that
   repository.
3. Push the change (we recommend using a separate branch for your feature).
    Verify the tests are passing and there is no issue with QA:
    ```sh
        $cmake --build build --target test
    ```
4. Open a pull request.
5. We try to merge and deploy changes as soon as possible, or at least leave
   some feedback, but if you haven't heard back from us after a couple of days,
   feel free to leave a comment on the pull request.

## Resources

- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
- [Using Pull Requests](https://help.github.com/articles/about-pull-requests/)
- [GitHub Help](https://help.github.com)

Thank you for your suggestions!

