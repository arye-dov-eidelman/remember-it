# Remember It

## A tool for creating learning tracks with a focus on reviewing completed quizes until you actually remember it

## Features

- [ ] Public tracks ***mvp***

- Multiple question types
  - [ ] Multiple choice ***mvp***
  - [ ] Multi select - choose more than one answer (or zero) ***v2***
  - [ ] True or False ***v2***
  - [ ] Text input (not case sensitve!) ***v2***
  - [ ] Sort - sort out a list of items

- [ ] Randomly ordered answers for Multiple choice, Multi select answers and sort ***v2***

- [ ] Import / Export Json ***v2***

- [ ] Private tracks ***v2***

- School options ***v3***
  - [ ] Control panel for viewing student progress per class
  - [ ] Control panel for viewing student progress per school
  - [ ] Parental access / email reports for viewing student progress
  - [ ] Unlisted (share by link)
  - [ ] Staff can sign students in, so students don't need passwords
  - [ ] Versioning system for upgrading tracks
  - [ ] Question difficulty rating based on real data on how many students get it right or wrong (ensure this isn't deleted on a curriculum version upgrade)
  - [ ] Competitions class and school (use difficulty rating to start off easy and get harder and harder)
  - [ ] Customization options

## Installation

```bash
git clone https://github.com/arye-dov-eidelman/remember-it.git
cd remember-it
bundle install
rake db:migrate
rackup config.ru
```

## Usage

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/arye-dov-eidelman/remember-it>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source for non commercial use under the terms of the [Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/).

## Code of Conduct

Everyone interacting in the remember-it project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/arye-dov-eidelman/remember-it/blob/master/CODE_OF_CONDUCT.md).
