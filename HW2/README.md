# HW2 - Learn Git Branching

## 1. Overview

For this homework, I used the [Learn Git Branching](https://learngitbranching.js.org/) interactive game to practice Git commands and understand how version control works.

I completed three sequences:

1. Introduction Sequence
2. Ramping Up Sequence
3. Push & Pull -- Git Remotes!

Below are the commands for each level and a summary of what I learned.

## 2. Introduction Sequence

### Level 1: Introduction to Git Commits

```bash
git commit
git commit
```

Create two new commits.

### Level 2: Branching in Git

```bash
git checkout -b bugFix
```

Create a new branch named `bugFix` and switch to it.

### Level 3: Merging in Git

```bash
git branch bugFix
git checkout bugFix
git commit
git checkout main
git commit
git merge bugFix
```

Create commits on two branches and merge `bugFix` into `main`.

### Level 4: Rebase Introduction

```bash
git checkout -b bugFix
git commit
git checkout main
git commit
git checkout bugFix
git rebase main
```

Rebase the `bugFix` branch onto `main` to create a linear commit history.

## 3. Ramping Up Sequence

### Level 1: Detach yo' HEAD

```bash
git checkout C4
```

Detach HEAD by checking out a specific commit.

### Level 2: Relative Refs (^)

```bash
git checkout bugFix^
```

Move HEAD to the parent commit of `bugFix`.

### Level 3: Relative Refs #2 (~)

```bash
git checkout HEAD^
git branch -f main C6
git branch -f bugFix HEAD^
```

Use relative references and force branch pointers to move to specific commits.

### Level 4: Reversing Changes in Git

```bash
git reset HEAD^
git checkout pushed
git revert pushed
```

Use `git reset` to move the local branch backward and `git revert` to create a new commit that reverses an earlier change.

## 4. Push & Pull -- Git Remotes!

### Level 1: Clone Intro

```bash
git clone
```

Clone a remote repository.

### Level 2: Remote Branches

```bash
git commit
git checkout o/main
git commit
```

Create commits locally and observe how remote-tracking branches behave.

### Level 3: Git Fetchin'

```bash
git fetch
```

Download updates from the remote repository without merging them into the current branch.

### Level 4: Git Pullin'

```bash
git pull
```

Fetch remote changes and integrate them into the current branch.

### Level 5: Faking Teamwork

```bash
git clone
git fakeTeamwork 2
git commit
git pull
```

Simulate remote changes, create a local commit, and integrate the remote updates.

### Level 6: Git Pushin'

```bash
git commit
git commit
git push
```

Create two commits and push them to the remote repository.

### Level 7: Diverged History

```bash
git clone
git fakeTeamwork 1
git commit
git pull --rebase
git push
```

Use rebase to integrate remote updates when local and remote histories have diverged, then push the changes.

### Level 8: Locked Main

```bash
git branch feature
git checkout feature
git branch -f main c1
git push
```

Practice working with a protected main branch and handling branch references.

## 5. Homework Process

I followed these steps to complete the assignment:

1. Opened the Learn Git Branching website.
2. Completed the Introduction Sequence under the Main tab.
3. Completed the Ramping Up Sequence under the Main tab.
4. Switched to the Remote tab and completed the Push & Pull -- Git Remotes! sequence.
5. Took screenshots showing the completion of each sequence.
6. Created a new folder named `HW2` in my homework repository.
7. Saved the three screenshots and this `README.md` file in the `HW2` folder.
8. Used Git commands to commit and upload the files to GitHub.

### GitHub Submission Commands

```bash
git add HW2/
git commit -m "Complete HW2 Git branching exercises"
git push
```

After pushing, I checked the GitHub repository to verify that the screenshots and README file were uploaded.

## 6. AI Assistance
I completed the interactive game exercises myself and used AI assistance to review the commands and prepare this README.

## 7. What I Learned

This assignment helped me understand the differences between commits, branches, and HEAD. I also practiced merging and rebasing branches, using relative commit references, and reversing changes with `reset` and `revert`.

The remote repository exercises helped me understand how `clone`, `fetch`, `pull`, and `push` work together in a collaborative Git workflow.
