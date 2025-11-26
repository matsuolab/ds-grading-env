# Data Science Gradeing Env

## Build Image on local

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
