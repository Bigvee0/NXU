# Worker Payment Automation for Highridge Construction Company

This project provides Python and R scripts to automate weekly salary processing and payment slip generation for 400 construction workers. The system dynamically assigns employee levels based on salary and gender conditions and generates individual payment slips in plain text.

---

## Features

- Dynamically generates 400 worker profiles with random names, salaries, and gender.
- Assigns employee levels using conditional logic:
  - **A1**: Salary > $10,000 and < $20,000
  - **A5-F**: Female workers with salary > $7,500 and < $30,000
- Generates a text-based payment slip for each worker.
- Exception handling included to prevent interruption during processing.


---

## How to Use

---

## How to Use

### 🔧 Python Script (`worker_payment.py`)

1. **Navigate to the Folder**:
   Go to the `python_version` folder in your terminal or file explorer.

2. **Run the Script**:
   Ensure Python 3 is installed. Then run:
   ```bash
   python worker_payment.py
### 🔧 R Script (worker_payment.R)

1. **Navigate to the Folder**:
   Go to the r_version folder..

2. **Install Dependencies (only once)**:
   In your R console or RStudio, run:

3. **Run the Script**:
   Still in R or RStudio:

4. **Output**:
   A folder named payment_slips_r will be created. It will contain 400 individual text files for each worker.



