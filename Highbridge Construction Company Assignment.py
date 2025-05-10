import random
import string
import os

# Generate dynamic list of 400 workers
num_workers = 400
workers = []

def generate_name():
    return ''.join(random.choices(string.ascii_uppercase, k=5))

for i in range(num_workers):
    worker = {
        'id': i + 1,
        'name': generate_name(),
        'gender': random.choice(['male', 'female']),
        'salary': random.randint(5000, 35000)
    }
    workers.append(worker)

# Create directory to store slips
os.makedirs("payment_slips", exist_ok=True)

# Generate payment slips with conditions
for worker in workers:
    try:
        level = ""
        if 10000 < worker['salary'] < 20000:
            level = "A1"
        if 7500 < worker['salary'] < 30000 and worker['gender'] == 'female':
            level = "A5-F"

        slip_content = (
            f"Payment Slip\n"
            f"==============\n"
            f"ID: {worker['id']}\n"
            f"Name: {worker['name']}\n"
            f"Gender: {worker['gender']}\n"
            f"Salary: ${worker['salary']}\n"
            f"Level: {level}\n"
        )

        with open(f"payment_slips/worker_{worker['id']}.txt", 'w') as slip_file:
            slip_file.write(slip_content)

    except Exception as e:
        print(f"Error processing worker {worker['id']}: {e}")
