# Passlist

## About

It's an application to make easier and agile taking record of the attendance of students enrolled in a course.

You can see the [repo](https://github.com/warborn/android_passlist) of the android client.

##### Rails features applied: 

- Authentication with [Devise Token Auth](https://github.com/lynndylanhurley/devise_token_auth)
- Send account verification email with [Mailgun](https://github.com/jorgemanrubia/mailgun_rails)
- Import CSV file to register students
- Internationalization (Spanish)
- JSON Serialization with [ActiveModelSerializers](https://github.com/rails-api/active_model_serializers)

## Features

A new user can register a new account, confirm it via email and then sign in.

The user can create courses (groups), with the following information:
- ID
- Subject
- Start Date (of schoolar period)
- End Date (of schoolar period)
- Class Days

Next, the application will create a schedule (calendar) based on the class days, start and end date of the new course.

The user can import a ***.csv*** file with the following form to add new students to a given course and also update them.

![Screenshot of a .csv file contents](https://s20.postimg.org/9djdkkmy5/import.png)

The API allows to query the following information:
- Courses (grupos)
- Schedule (a calendar of classes)
- A single Class to register the attendance of students

## Installation

First you need to config the mailer method, currently using mailgun, set environment variables accordingly.

```ruby
config.action_mailer.delivery_method = :mailgun
config.action_mailer.mailgun_settings = {
  api_key: ENV['MAILGUN_KEY'],
  domain: ENV['MAILGUN_KEY']
}
```

cd into the project directory and execute the following commands:

```sh
bundle install
rake db:migrate
rails s
```

## Usage

##### Users endpont:

- A **POST** request to ***/auth*** will create a new user:

```json
{
    "user": {
        "email": "email@email.com",
        "last_name": "Test",
        "maiden_name": "User",
        "first_name": "John Doe",
        "password": "password",
        "password_confirmation": "password"
    }
}
```

- A **POST** request to ***/auth/sign_in*** will sign in the user:

```json
{
    "user": {
        "email": "email@email.com",
        "password":
         "password"
    }
}
```

- A **DELETE** request to ***/auth/sign_out*** will log out the current logged in user.

##### Courses (groups) endpoint:

- A **POST** request to ***/groups*** will create a new group:

```json
{
    "group": {
        "name": "2101",
        "subject": "Programación 01",
        "begin_date": "2016-02-01",
        "end_date": "2016-05-27",
        "classdays_attributes": [
            {
                "day": "Lunes",
                "begin_time": "08:00",
                "end_time": "10:00"
            },
            {
                "day": "Miércoles",
                "begin_time": "08:00",
                "end_time": "10:00"
            },
            {
                "day": "Viernes",
                "begin_time": "08:00",
                "end_time": "10:00"
            }
        ]
    }
}
```

- A **GET** request to ***/groups*** will retrieve a list with the groups registered
by the current user.

```json
[
    {
        "id": 1,
        "name": "2101",
        "subject": "Base de datos",
        "begin_date": "2016-02-01",
        "end_date": "2016-05-27"
    },
    {
        "id": 2,
        "name": "3101",
        "subject": "Grupo de Ejemplo 1",
        "begin_date": "2016-02-01",
        "end_date": "2016-02-08"
    },
    {
        "id": 3,
        "name": "3102",
        "subject": "Grupo de Ejemplo 2",
        "begin_date": "2016-02-01",
        "end_date": "2016-02-08"
    }
]
```

- A **GET** request to ***/groups/:id*** will retrieve a single group along with the schedule:

```json
{
    "group": {
        "id": 1,
        "name": "2101",
        "subject": "Base de datos",
        "begin_date": "2016-02-01",
        "end_date": "2016-05-27"
    },
    "classes": [
        {
            "id": 1,
            "date": "Lunes 01 de Febrero del 2016",
            "active": true
        },
        {
            "id": 18,
            "date": "Miércoles 03 de Febrero del 2016",
            "active": true
        },
        {
            "id": 35,
            "date": "Viernes 05 de Febrero del 2016",
            "active": true
        },
        {
            "id": 2,
            "date": "Lunes 08 de Febrero del 2016",
            "active": true
        },
        {
            "id": 19,
            "date": "Miércoles 10 de Febrero del 2016",
            "active": true
        }
    ]
}
```

 - Send a **POST** request to ***/groups/:id/students/import*** with a ***.cvs*** file to import a list of students. 
This endpoint need a key of ***student_import[file]*** with the file as a value, an example using HTML will be:

```html
<form action="/groups/1/students/import" method="***POST***" enctype="multipart/form-data">
  <input type="file" name="student_import[file]">
</form>
```

##### Classes endpoint:

- A **GET** request to ***/classes/:id*** will retrieve the info about a class and the list of students enrolled:

```json
{
    "class": {
        "id": 1,
        "date": "Lunes 01 de Febrero del 2016",
        "active": true
    },
    "students": [
        {
            "id": 1,
            "account_number": "300306064",
            "last_name": "Lovato",
            "maiden_name": "Quiñones",
            "first_name": "Victoria",
            "assist": true
        },
        {
            "id": 2,
            "account_number": "301306064",
            "last_name": "Armas",
            "maiden_name": "Gallardo",
            "first_name": "Concepción",
            "assist": true
        },
        {
            "id": 3,
            "account_number": "302306064",
            "last_name": "Coronado",
            "maiden_name": "Limón",
            "first_name": "Ana María",
            "assist": true
        }
    ]
}
```

- A **PATCH** request to ***/classes/:id/students/:student_id/assist*** will update between true or false the attendance status of a student for a given class.
