import random

workers = []
for i in range(400):
    worker = {
        'id': i + 1,
        'name': f'Staff_{i + 1}',
        'salary': random.randint(5000, 30000),
        'gender': random.choice(['Male', 'Female'])
    }
    workers.append(worker)

def generate_payment_slips(workers):
    payment_slips = []
    for worker in workers:
        try:
            worker_id = worker['id']
            worker_name = worker['name']
            salary = worker['salary']
            gender = worker['gender']
            employee_level = 'Unknown'

            if 10000 < salary <20000:
                employee_level = 'A1'
            if 7500 < salary < 30000 and gender == 'Female':
                employee_level = 'A5-F'
            
            payment_slip = {
                'worker_id': worker_id,
                'worker_name': worker_name,
                'salary': salary,
                'employee_level': employee_level
            }
            payment_slips.append(payment_slip)
        except Exception as e:
            print(f"Error processing worker {worker['id']}: {e}")
        
    return payment_slips
payment_slips = generate_payment_slips(workers)

for slip in payment_slips:
    print(slip)