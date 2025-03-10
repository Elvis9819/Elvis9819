set.seed(123)
workers <- data.frame(
  id = 1:400,
  name = paste0('Staff_', 1:400),
  salary = sample(5000:30000, 400, replace = TRUE),
  gender = sample(c('Male', 'Female'), 400, replace = TRUE)
)

generate_payment_slips <- function(workers) {
  payment_slips <- list()
  
  for (i in 1:nrow(workers)) {
    tryCatch({
      worker_id <- workers$id[i]
      worker_name <- workers$name[i]
      salary <- workers$salary[i]
      gender <- workers$gender[i]
      employee_level <- 'Unknown'
      
      if (salary > 10000 & salary < 20000) {
        employee_level <- 'A1'
      }
      if (salary > 7500 & salary < 30000 & gender == 'Female') {
        employee_level <- 'A5-F'
      }
      
      payment_slip <- list(
        worker_id = worker_id,
        worker_name = worker_name,
        salary = salary,
        employee_level = employee_level
      )
      payment_slips[[length(payment_slips) + 1]] <- payment_slip
    }, error = function(e) {
      message(sprintf("Error processing worker %d: %s", workers$id[i], e$message))
    })
  }
  
  return(payment_slips)
}

payment_slips <- generate_payment_slips(workers)

print(payment_slips)  

