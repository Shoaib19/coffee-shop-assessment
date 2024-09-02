# Coffee Shop Order Management System

This project is a simple order management system for a coffee shop. It allows customers to view menu items, create orders, make payments, and return items if needed.

## Getting Started

### Prerequisites

- Ruby (version 3.2.0)
- Rails (version 7.0.5)
- SQLite3

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Shoaib19/coffee-shop-assessment.git
   cd coffee-shop-assessment
   ```

2. **Install dependencies**:
   ```bash
   bundle install
   ```

3. **Set up the database**:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Seed the database**: This will add items to the menu.
   ```bash
   rails db:seed
   ```

### Running the Server

Start the Rails server with:

```bash
rails server
```

The server will run at `http://localhost:3000`.

## API Endpoints

### 1. Get Menu

- **URL**: `GET http://localhost:3000/menu`
- **Description**: Fetches all menu items.
- **Payload**: No payload required.

### 2. Create Order

- **URL**: `POST http://localhost:3000/orders/create`
- **Description**: Creates a new order for the customer.
- **Sample Payload**:

    ```json
    {
        "order": {
            "customer": {
                "name": "Paula",
                "email": "Paula@coffee.com",
                "phone": "0300 999 8888"
            },
            "items": [
                {
                    "name": "Espresso", 
                    "quantity": 3
                },
                {
                    "name": "Green Tea",
                    "quantity": 1
                },
                {
                    "name": "Veggie Wrap",
                    "quantity": 4
                },
                {
                    "name": "Lemonade",
                    "quantity": 1
                },
                {
                    "name": "Turkey Club Sandwich",
                    "quantity": 1
                },
                {
                    "name": "Iced Coffee",
                    "quantity": 3
                },
                {
                    "name": "Cappuccino",
                    "quantity": 1
                }
            ]
        }
    }
    ```

### 3. Make Payment

- **URL**: `POST http://localhost:3000/pay`
- **Description**: Processes payment for a created order.
- **Sample Payload**:

    ```json
    {
        "payment": {
            "order_id": 16,
            "card_number": "5555 5555 5555 4444",
            "card_type": "credit"
        }
    }
    ```

### 4. Return Items

- **URL**: `POST http://localhost:3000/return/items`
- **Description**: Allows users to return some or all items from an order.
- **Sample Payload**:

    ```json
    {
        "return": {
            "order_id": 14,
            "item_ids": [92, 96],
            "reason": "not fresh"
        }
    }
    ```

## Payload Attributes Table

| Endpoint               | Attribute        | Type     | Required | Description                        | Example Value                   |
|------------------------|------------------|----------|----------|------------------------------------|---------------------------------|
| `POST /orders/create`  | `customer`       | Object   | Yes      | Customer information               |                                 |
|                        | `name`           | String   | Yes      | Customer's name                    | `"Paula"`                       |
|                        | `email`          | String   | Yes      | Customer's email address           | `"Paula@coffee.com"`            |
|                        | `phone`          | String   | Yes      | Customer's phone number            | `"0300 999 8888"`               |
|                        | `items`          | Array    | Yes      | List of items in the order         |                                 |
|                        | `name`           | String   | Yes      | Name of the menu item              | `"Espresso"`                    |
|                        | `quantity`       | Integer  | Yes      | Quantity of the menu item          | `3`                             |
| `POST /pay`            | `payment`        | Object   | Yes      | Payment details                    |                                 |
|                        | `order_id`       | Integer  | Yes      | ID of the order being paid for     | `16`                            |
|                        | `card_number`    | String   | Yes      | Credit/Debit card number           | `"5555 5555 5555 4444"`         |
|                        | `card_type`      | String   | Yes      | Type of the card (credit/debit)    | `"credit"`                      |
| `POST /return/items`   | `return`         | Object   | Yes      | Return request details             |                                 |
|                        | `order_id`       | Integer  | Yes      | ID of the order to return items from | `14`                         |
|                        | `item_ids`       | Array    | Yes      | IDs of the items to be returned    | `[92, 96]`                      |
|                        | `reason`         | String   | Yes      | Reason for returning the items     | `"not fresh"`                   |



## Notes

- Ensure that the `order_id` provided in the payment and return APIs corresponds to an existing order.
- The `item_ids` in the return payload should reference existing items from the specified order.

### Common Errors

- If you receive an error related to validation, make sure all required attributes are included in the payload.

## Additional Information

- if user order includes the "Veggie Wrap" along with the "Lemonade" then he will get 50% discount on both of these 
- if user order includes the "Turkey Club Sandwich" along with the "Iced Coffee" then he can get free "Iced Coffee" max 3 in each order
- the PostMan collection is added under the name of "coffee-shop-collection.postman_collection.json" to this repo

```