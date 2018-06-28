> > > # Notice: This file is deprecated in favor of remember_it_uml_diagram.html

# Remember it

## User

- ### attributes

  - firs_tname        string
  - last_name         string
  - email             string
  - password(_digest) string

- ### asocciations

  has_many :learning_tracks, through: :learning_tracks source: :tracks
  has_many :curriculum_tracks, through: :curriculum_tracks, source: :tracks

## Question

- ### attributes

  - number        integer
  - question_text string
  - answer_type   string  ( multiple_choice | multi_select | number )
  - chapter_id    integer

- ### asocciations

  - has many answers
  - belongs to a chapter
  - belongs to a track (through chapters)

## Answer

- ### attributes

  - question_id   integer
  - answer_text   string
  - answer_number integer
  - correct       boolean

- ### asocciations

  - belongs to a question

## Chapter

- ### attributes

  - title     string
  - number    integer
  - track_id   integer

- ### asocciations

  - has many questions
  - belongs to a track

## Track

- ### attributes

  - title

- ### asocciations

  - has many chapters
  - has many questions (through chapters)
