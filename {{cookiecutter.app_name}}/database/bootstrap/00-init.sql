CREATE USER {{cookiecutter.app_name}};
CREATE DATABASE {{cookiecutter.app_name}}-dev;
CREATE DATABASE {{cookiecutter.app_name}}-test;
GRANT ALL PRIVILEGES ON DATABASE {{cookiecutter.app_name}}-dev TO {{cookiecutter.app_name}};
GRANT ALL PRIVILEGES ON DATABASE {{cookiecutter.app_name}}-test TO {{cookiecutter.app_name}};
