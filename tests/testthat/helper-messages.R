# Runs code, silencing only the package's messages of the given classes
# (like suppressMessages(code, classes = classes), which needs R >= 4.0).
# Any other message, and every warning and error, still comes through.
allow_messages <- function(code, classes = "asciiSetupReader_message") {
  withCallingHandlers(code, message = function(m) {
    if (inherits(m, classes)) invokeRestart("muffleMessage")
  })
}

# The messages (as text) and their classes that code signals.
messages_from <- function(code) {
  found <- list()
  withCallingHandlers(code, message = function(m) {
    found[[length(found) + 1]] <<- m
    invokeRestart("muffleMessage")
  })
  found
}
