# Load necessary library
if(!require("stringi")) install.packages("stringi", dependencies=TRUE)
library(stringi)

# Set seed for reproducibility
set.seed(42)

# Generate dynamic list of 400 workers
num_workers <- 400
workers <- data.frame(
  id = 1:num_workers,
  name = stri_rand_strings(num_workers, 5, pattern = "[A-Z]"),
  gender = sample(c("male", "female"), num_workers, replace = TRUE),
  salary = sample(5000:35000, num_workers, replace = TRUE),
  stringsAsFactors = FALSE
)

# Create directory to store slips
if (!dir.exists("payment_slips_r")) {
  dir.create("payment_slips_r")
}

# Generate payment slips with conditions
for (i in 1:nrow(workers)) {
  tryCatch({
    worker <- workers[i, ]
    level <- ""
    
    if (worker$salary > 10000 && worker$salary < 20000) {
      level <- "A1"
    }
    if (worker$salary > 7500 && worker$salary < 30000 && worker$gender == "female") {
      level <- "A5-F"
    }
    
    slip_content <- paste0(
      "Payment Slip\n",
      "==============\n",
      "ID: ", worker$id, "\n",
      "Name: ", worker$name, "\n",
      "Gender: ", worker$gender, "\n",
      "Salary: $", worker$salary, "\n",
      "Level: ", level, "\n"
    )
    
    writeLines(slip_content, paste0("payment_slips_r/worker_", worker$id, ".txt"))
  }, error = function(e) {
    cat("Error processing worker ", workers$id[i], ": ", e$message, "\n")
  })
}
