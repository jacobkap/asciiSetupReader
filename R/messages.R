# Messages and errors -----------------------------------------------------------
#
# Messages are signalled with classes so that they can be caught or silenced
# one kind at a time, e.g.
#   suppressMessages(read_ascii_setup(...),
#                    classes = "asciiSetupReader_implied_decimals")
# Every message also has the class "asciiSetupReader_message", so
#   suppressMessages(..., classes = "asciiSetupReader_message")
# silences all of them.

# Signals a message of class asciiSetupReader_<type>. The pieces in ... are
# pasted together.
inform <- function(type, ...) {
  condition <- structure(
    class = c(paste0("asciiSetupReader_", type), "asciiSetupReader_message",
              "message", "condition"),
    list(message = paste0(..., "\n"), call = NULL)
  )
  message(condition)
}

# Stops with an error of class asciiSetupReader_<type>.
abort <- function(type, ...) {
  condition <- structure(
    class = c(paste0("asciiSetupReader_", type), "asciiSetupReader_error",
              "error", "condition"),
    list(message = paste0(...), call = NULL)
  )
  stop(condition)
}

# "a, b, c" for up to `max` items, then "and N more".
list_items <- function(items, max = 20) {
  if (length(items) > max) {
    return(paste0(paste(items[1:max], collapse = ", "), " and ",
                  length(items) - max, " more"))
  }
  paste(items, collapse = ", ")
}
