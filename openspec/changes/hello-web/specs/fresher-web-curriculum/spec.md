## ADDED Requirements

### Requirement: Mission-based fresher curriculum structure
The course SHALL be organized into mission-based Parts and short Chapters with stated learnings, creations, prerequisites, run steps, verification, and next tries, progressing from web basics to HTML to CSS to JavaScript to DOM interaction to games/challenges.

#### Scenario: Student follows Parts in order
- **WHEN** a student starts at Part I and follows Parts in order
- **THEN** each Chapter states what will be learned, why it is useful, what will be created, what is needed before starting, how to complete it, how to verify it, and what to try next

#### Scenario: No large-project dependency
- **WHEN** a student completes any Chapter activity
- **THEN** that activity is independently runnable and does not require completion of a prior large application

### Requirement: Full-code demos with scaffolded assessment
Demonstration activities SHALL provide complete runnable HTML/CSS/JS with file paths, run steps, expected behavior, section walkthroughs, and modification tries; assessed challenges SHALL provide requirements, plan, hints, and acceptance criteria with solutions kept separate.

#### Scenario: Demo runs immediately
- **WHEN** a student copies a demonstration activity into the documented file path and opens it as instructed
- **THEN** it runs without missing files, unexplained libraries, or unmentioned setup

#### Scenario: Challenge requires independent work
- **WHEN** a student attempts a Level-3 Build-It-Yourself challenge
- **THEN** the instructions provide requirements, hints, and acceptance criteria without revealing the complete solution inline

### Requirement: Beginner pedagogy and gamification without servers
The course SHALL use plain-English first-use explanations, predict-before-run prompts, debugging routines, and self-tracked badges (Explorer through Web Creator) with XP for completion and modification, requiring no accounts, servers, leaderboards, timers, or paid services.

#### Scenario: Progress is self-trackable offline
- **WHEN** a student completes Chapters without network accounts
- **THEN** they can track badges and checklists locally and each milestone gives a tangible sense of progress
