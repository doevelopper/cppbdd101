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


## ❤️ Ways to Contribute

* Blog or tweet about the project
* Improve documentation
* Fix a bug
* Implement a new feature
* Discuss potential ways to improve project
* Improve existing implementation, performance, etc.

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
* To match the existing code styling, use `npm run prettier` before committing code.
* Make sure the tests pass (run `npm test`). Your changes probably deserve new tests as well.
* Remember that this project is cross-platform compatible (macOS, Windows, Linux), and that it runs in different versions of Node.

Unsure about whether you should open a pull request? Feel free to discuss it first in a ticket.

Set up the project on your machine:

```bash
    git clone git@github.com:<>.git
    cd <>
    cmake --build build --target verify
```

Verify the tests are passing and there is no issue with QA:

```sh
    $cmake --build build --target test
```

To make release-it globally available so you can run it on your (test) project:

```sh
    cmake --build build --target integration-test
```

Thank you for your suggestions!

