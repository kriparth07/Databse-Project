db = db.getSiblingDB("customerorders")

db.createCollection("manufacturers", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [ "name", "address" ],
      properties: {
        name: {
          bsonType: "string",
          description: "must be a string and is required"
        },
        address: {
          bsonType: "object",
          required: [ "street", "city", "state", "zip" ],
          properties: {
            additional: {
              bsonType: "string",
              description: "must be a string if the field exists"
            },
            street: {
              bsonType: "string",
              description: "must be a string and is required"
            },
            city: {
              bsonType: "string",
              description: "must be a string and is required"
            },
            state: {
              bsonType: "string",
              description: "must be a string and is required"
            },
            zip: {
              bsonType: "string",
              description: "must be a string and is reuired"
            }
          }
        },
        phone: {
          bsonType: "string",
          description: "must be a string and is required"
        }
      }
    }
  }
})


db.createCollection("customers")
db.createCollection("items")
db.createCollection("orders")