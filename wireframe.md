# Admin Panel

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