# Tea Subscription Service

This project was created as a simulation of a take-home challenge from the interview process for the Turing School of Software and Design's Mod 4. The point of the assignment is to create a RESTful API that allows users to create/cancel and list subscriptions to a tea service. This API is built with Ruby on Rails, using PostgreSQL and Postman.

## Database Design

<img src="https://user-images.githubusercontent.com/120869196/258212944-aa399f82-5c2a-4792-b09e-0b89d0742e06.png" alt="Schema" width="100%">

## Endpoints

### GET `/customers`
___
#### Response
```
"data": [
        {
            "id": "1",
            "type": "customer",
            "attributes": {
                "first_name": "Greg",
                "last_name": "Miller",
                "email": "ceosenior@kindafunny.com",
                "address": "1234 Fake St"
            }
        },
        {
            "id": "2",
            "type": "customer",
            "attributes": {
                "first_name": "Tim",
                "last_name": "Gettys",
                "email": "tim_mf_gettys@kindafunny.com",
                "address": "123 Main Street"
            }
        }
      ]
```

### GET `/teas`
___
#### Response: 
```
"data": [
        {
            "id": "1",
            "type": "tea",
            "attributes": {
                "title": "Earl Grey",
                "description": "A classic black tea with a citrusy twist",
                "brew_temp": "200",
                "brew_time": "3"
            }
        },
        {
            "id": "2",
            "type": "tea",
            "attributes": {
                "title": "English Breakfast",
                "description": "A classic black tea",
                "brew_temp": "184",
                "brew_time": "5"
            }
        },
        {
            "id": "3",
            "type": "tea",
            "attributes": {
                "title": "Black",
                "description": "A classic black tea",
                "brew_temp": "197",
                "brew_time": "1"
            }
        }
      ]
```

### GET `/customers/:customer_id/subscriptions`
___
#### Response:
```
"data": [
        {
            "id": "41",
            "type": "subscription",
            "attributes": {
                "title": "Tea Subscription",
                "price": "$85.98",
                "status": "Active",
                "frequency": "Monthly",
                "tea_id": 3,
                "customer_id": 9
            }
        },
        {
            "id": "42",
            "type": "subscription",
            "attributes": {
                "title": "Tea Subscription",
                "price": "$92.51",
                "status": "Active",
                "frequency": "Monthly",
                "tea_id": 8,
                "customer_id": 9
            }
        },
        {
            "id": "43",
            "type": "subscription",
            "attributes": {
                "title": "Tea Subscription",
                "price": "$40.28",
                "status": "Active",
                "frequency": "Monthly",
                "tea_id": 7,
                "customer_id": 9
            }
        }        
    ]
}
```

### POST `/subscriptions`
___
#### Body:
```
{
    "customer_id": 1,
    "tea_id": 9,
    "frequency": "monthly",
    "status": "active",
    "price": "10.00",
    "title": "Tea Subscription"
}
```

#### Response:
```
  {
    "data": {
        "id": "62",
        "type": "subscription",
        "attributes": {
            "title": "Tea Subscription",
            "price": "10.00",
            "status": "active",
            "frequency": "monthly",
            "tea_id": 9,
            "customer_id": 1
        }
    }
}
```

### PUT `/subscriptions/:sub_id/cancel`
___
#### Response:
```
{
    "data": {
        "id": "43",
        "type": "subscription",
        "attributes": {
            "title": "Tea Subscription",
            "price": "$40.28",
            "status": "canceled",
            "frequency": "Monthly",
            "tea_id": 7,
            "customer_id": 9
        }
    }
}
```
