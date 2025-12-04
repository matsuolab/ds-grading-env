# Data Science Grading Env

grading-env is an execution environment designed to run custom scoring scripts for assignment submissions.

This project provides libraries and runtime utilities that were originally used in a private educational platform to execute grading scripts in a controlled environment. It is published as open-source to promote transparency and share implementation details with the broader community.

Note: This repository does not include the scoring scripts themselves.  
Only the execution environment and related utilities are provided.

---

## Purpose

- Provide a runtime environment for executing custom scoring logic  
- Share implementation details of the execution framework  
- Make the technical foundation publicly available as open-source software

---

## License

This project is released under the MIT License.  
Refer to the `LICENSE` file for details.

---

## Contributions

Active development or ongoing maintenance is not intended.  
Issues or pull requests may not receive a response.

---

## Background

The execution environment published in this repository was originally used as part of an internal workflow for automated grading.  
It has been made publicly available by the grading-lab community for reference and transparency purposes only.

No affiliation with any specific organization, institution, or individual is implied.

---

## Disclaimer

The software is provided "as is", without warranty of any kind.  
The authors and copyright holders assume no responsibility for any consequences resulting from its use.

---

## How to use

```bash
docker build -t local/score ./
```

## Run a container

```bash
docker run --rm \
 -e USERSUBMISSION=/app/workspace/submission.py \
 -v $PWD/example:/app/workspace local/score \
 python3 /app/workspace/score.py
```
