import pandas as pd
from faker import Faker
import random
from datetime import datetime, timedelta

# Initialize Faker
fake = Faker()

# Number of rows to generate
num_rows = 2000

# Generate unique user IDs (random numbers between 1 and 1000)
user_ids = random.choices(range(1, 1001), k=num_rows)

# Generate dummy data
# data = {
#     "userID": list(range(1, num_rows + 1)),  # Sequential IDs from 1 to num_rows
#     "email": [fake.email() for _ in range(num_rows)],
#     "name": [fake.name() for _ in range(num_rows)],
#     "username": [fake.user_name() for _ in range(num_rows)],
#     "address": [fake.address().replace("\n", ", ") for _ in range(num_rows)],  # Format multi-line addresses
#     "phoneNumber": [fake.phone_number() for _ in range(num_rows)],
#     "paymentInfo": [fake.credit_card_number() for _ in range(num_rows)],
# }

# data = {
#     "userID": list(range(500, 500+num_rows)),  # Sequential IDs from 1 to num_rows
#     "email": [fake.email() for _ in range(num_rows)],
#     "name": [fake.name() for _ in range(num_rows)],
#     "username": [fake.user_name() for _ in range(num_rows)],
#     "address": [fake.address().replace("\n", ", ") for _ in range(num_rows)],  # Format multi-line addresses
#     "phoneNumber": [fake.phone_number() for _ in range(num_rows)],
#     "paymentInfo": [fake.credit_card_number() for _ in range(num_rows)],
#     "workEmail": [fake.company_email() for _ in range(num_rows)],  # Work email
#     "officeContactInfo": [fake.phone_number() for _ in range(num_rows)],  # Office contact info (phone number)
#     "commissionPercentage": [round(random.uniform(0.05, 0.2), 3) for _ in range(num_rows)],  # Commission percentage (between 5% and 20%)
# }
# data = {
#     "appointmentId": list(range(1, num_rows + 1)),  # Sequential IDs from 1 to num_rows
#     "userId": user_ids,  # Unique user IDs
#     "additionalMessage": [fake.text(max_nb_chars=100) for _ in range(num_rows)],  # Random text for additionalMessage
#     "dte": [fake.date_between(start_date="-1y", end_date="today") for _ in range(num_rows)],  # Random appointment dates in the last year
#     "preApprovedMortgage": [round(random.uniform(100000, 500000), 2) for _ in range(num_rows)],  # Random mortgage amounts between 100,000 and 500,000
#     "hasBroker": [random.choice([0, 1]) for _ in range(num_rows)],  # Random 0 or 1 for hasBroker
#     "viewerInfo": [fake.sentence(nb_words=10) for _ in range(num_rows)],  # Random viewer info (sentence)
# }
# data = {
#     "filterID": list(range(1, num_rows + 1)),  # Sequential filter IDs from 1 to num_rows
#     "userID": user_ids,  # Random user IDs (with repetition)
#     "location": [fake.city() for _ in range(num_rows)],  # Random city names for location
#     "size": [random.randint(500, 4000) for _ in range(num_rows)],  # Random sizes between 500 and 4000 sq ft
#     "datePosted": [fake.date_this_year() for _ in range(num_rows)],  # Random dates within this year
#     "priceRange": [round(random.uniform(100000, 1000000), 2) for _ in range(num_rows)],  # Random price range between 100,000 and 1,000,000
#     "notes": [fake.text(max_nb_chars=100) for _ in range(num_rows)],  # Random notes
#     "postType": [random.choice([0, 1]) for _ in range(num_rows)],  # Random postType: 0 (sale), 1 (rent)
#     "basementFinished": [random.choice([0, 1]) for _ in range(num_rows)],  # Random basementFinished: 0 (No), 1 (Yes)
#     "numOfBedroom": [random.randint(1, 5) for _ in range(num_rows)],  # Random number of bedrooms (1 to 5)
#     "numOfWashroom": [round(random.uniform(1, 3), 1) for _ in range(num_rows)],  # Random number of washrooms (1.0 to 3.0)
# }

# Generate dummy data
data = {
    "messageId": list(range(1, num_rows + 1)),  # Sequential message IDs from 1 to num_rows
    "senderId": [],  # List to store sender IDs
    "receiverId": [],  # List to store receiver IDs
    "messageText": [fake.text(max_nb_chars=2000) for _ in range(num_rows)],  # Random message text (max 2000 chars)
    "subjectOfMessage": [fake.sentence(nb_words=5) for _ in range(num_rows)],  # Random subject with 5 words
    "dateSent": [fake.date_this_year() for _ in range(num_rows)],  # Random dates within this year
}

# Ensure senderId and receiverId are different
for _ in range(num_rows):
    sender = random.choice(user_ids)
    receiver = random.choice([user_id for user_id in user_ids if user_id != sender])  # Ensure receiver is not the sender
    data["senderId"].append(sender)
    data["receiverId"].append(receiver)


# Create a DataFrame
df = pd.DataFrame(data)

# Save to a CSV file (optional)
df.to_csv("message.csv", index=False)

# Display a few rows
print(df.head())
