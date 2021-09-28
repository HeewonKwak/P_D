FROM python:3.9.0

WORKDIR /home/

RUN echo "vfxcvxcvxcvxcvx"

RUN git clone https://github.com/HeewonKwak/P_D.git

WORKDIR /home/P_D/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=practice.settings.deploy && python manage.py collectstatic --noinput --settings=practice.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=practice.settings.deploy practice.wsgi --bind 0.0.0.0:8000"]
