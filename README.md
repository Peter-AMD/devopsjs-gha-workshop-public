# GHA Workshop [![Stage](https://github.com/davidrv87/devopsjs-gha-workshop/actions/workflows/on-feature-branch-push.yml/badge.svg)](https://github.com/davidrv87/devopsjs-gha-workshop/actions/workflows/on-feature-branch-push.yml) [![Production](https://github.com/davidrv87/devopsjs-gha-workshop/actions/workflows/on-tag.yml/badge.svg)](https://github.com/davidrv87/devopsjs-gha-workshop/actions/workflows/on-tag.yml)

## The Goal

The goal of this workshop is to help attendes understand how GHA works and how to effectively create GHA workflows as part of their CI/CD system.

---

## What you will learn

The idea of the workshop is to get **hands-on** experience on GHA. The main topics that will be covered by this workshop are:

- Authentication
  - AWS
  - NPM
  - GitHub
- Code steps:
  - Dependencies install
  - Lint
  - Test
  - Build
  - Pack
- Deploy:
  - BE: Lambda
  - FE static files to S3
- Terraform:
  - Plan
  - Apply
  - Output
- Notify:
  - GitHub status

All of the above will be split into blocks, and the host of the workshop will guide you through each block. You will get knowledge about GHA concepts, like:

- The concept of **repository secrets**.
- How to **group steps in jobs** with a given purpose.
- **Jobs dependencies** and order of execution: running jobs in sequence and in parallel, and the concept of **matrix**.
- How to split logic of Git events into **different workflow files** (on branch push, on `master`/`main` push, on tag, on deploy).
- To respect the concept of DRY (Don't Repeat Yourself), we will also explore the use of **common actions**, both within the same repo and from an external repo.

## What you will build

The end result of the workshop will be a simple FE/BE architecture as shown in this diagram.

![Architecture Diagram](architecture-diagram.png?raw=true "Architecture Diagram")

## Duration of the workshop

The workshop will have three parts:
- Part 1: 50 mins + 10 mins break
- Part 2: 50 mins + 10 mins break
- Part 3: 50 mins + 10 mins break

## Requirements

There is very little that you need to bring to the workshop:

- VS Code + Live Share extension.
- A working GitHub account to clone this repo.
- Terraform knowledge (recommended but not required).
- AWS knowledge (recommended but not required).

## What you will be deploying

Once the workflow is complete, you will have the following service running:

- The FE deployed to an S3 bucket.
- A Lambda that will act as your BE.
- Both connected using API Gateway via `GET /greeter` endpoint.

## How you should use this repo

Once you've cloned the repo, run the `./start-here.sh` script and input your name and surname.

Given that multiple people will be working on this same repo at the same time, the deployment to different environments may differ from a real world scenario. The instructor will let you know what you may be doing in an actual repo for your team depending on the Git event. Let's see how this will work.

### How to deploy to stage

The deployment to `stage` will happen for every push to any branch but `main`. Do not worry, as long as you have set your `ATTENDEE_NAME` variable in your workflow files, you will be deploying your own resources.

### How to deploy to stage

To deploy to `stage`, follow these steps:

- **From your own branch** (`feat/gha-workshop-name-surname`) create a tag with the following naming convention: `git tag vx.y.z-name-surname`.
- Push your tag `git push origin vx.y.z-name-surname`.

### How to deploy to prod

To deploy to `prod`, a manual intervention is required. From the `Actions` > `Deploy to prod` > `Run workflow` you will select your branch `feat/gha-workshop-name-surname`.

### How do I need that everything worked?

Once Terraform successfully finishes applying changes, it will output the S3 public URL. Go to the appropriate job and copy the URL from the output.

## (Optional) Clean after yourself

Once you finish the workshop, you can destroy the AWS resources you created, by running the `Destroy AWS resources` workflow specifying your `name-surname`.
