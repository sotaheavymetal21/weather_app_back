FROM tiangolo/uvicorn-gunicorn:python3.11
WORKDIR /code
COPY ./app/pyproject.toml /code/
RUN pip install --upgrade pip && pip install poetry
RUN poetry install
COPY app/ /code/
CMD ["poetry", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]