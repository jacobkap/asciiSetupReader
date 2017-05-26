# # Will read in fixed-width ASCII files using the
# # SAS setup file
#
#
#
# SAS_reader <- function(ascii_file, SAS_file, fix_values) {
#   text_file <- readr::read_lines(dataset_name)
#   codebook <- readr::read_lines(SAS_file)
#
# }
#
# SAS_proc_codebook <- function(codebook) {
#   proc <- data.frame(codebook[grep("^proc format", codebook,
#                          ignore.case = TRUE):
#                       grep("sas.* infile.*input statem", codebook,
#                            ignore.case = TRUE)],
#                      stringsAsFactors = FALSE)
#   proc[,1] <- gsub("\\' ", "\\'       ", proc[,1])
#   proc[,1] <- gsub("(.*)( .*=.*)", "\\1   \\2", proc[,1])
#   proc <- data.frame(unlist(stringr::str_split(proc, "  |;")),
#                      stringsAsFactors = FALSE)
#   proc <- data.frame(proc[proc[,1] != "",], stringsAsFactors = FALSE)
#   proc[,1] <- gsub("\\'|,", "", proc[,1])
#   proc[,1] <- gsub('\\"', '', proc[,1])
#   proc$value <- gsub("(.*)=.*", "\\1", proc[,1])
#   proc$label <- gsub(".*=(.*)", "\\1", proc[,1])
#   names(proc)[1] <- "column"
#   proc$column <- trimws(proc$column)
#   col <- proc$column[grep("^VALUE", proc$column)[1]]
#   for (i in 1:nrow(proc)) {
#     if (grepl("^VALUE", proc$column[i])) {
#       col <- proc$column[i]
#     }
#     proc$column[i] <- col
#   }
#   proc[,1] <- gsub("value *", "", proc[,1],
#                    ignore.case = TRUE)
#   proc_codebook <- proc[proc$value != proc$label,]
#
#   return(proc_codebook)
#
# }
# # Grabs the column names and numbers. For turning the
# # ASCII file into a data.frame.
# SAS_columns <- function(codebook) {
#   columns <- data.frame(codebook[grep("sas.* infile.*input statem", codebook,
#                                    ignore.case = TRUE):
#                                 grep("sas.* label state", codebook,
#                                      ignore.case = TRUE)],
#                         stringsAsFactors = FALSE)
#   columns[,1] <- gsub("(-[0-9]*) ", "\\1   ", columns[,1])
#   columns[,1] <- gsub("\\.[0-9]*", "", columns[,1])
#   columns <- data.frame(unlist(stringr::str_split(columns, "   ")),
#              stringsAsFactors = FALSE)
#   columns <- data.frame(columns[columns[,1] != "",],
#                         stringsAsFactors = FALSE)
#   columns[,1] <- trimws(columns[,1])
#   columns[,1] <- gsub(',|\\$|\\"|\\*', "", columns[,1])
#   columns$first <- gsub(".* (.*)-.*", "\\1", columns[,1])
#   columns$first[grep("-", columns[,1], invert = TRUE)] <-
#                           gsub(".* ([0-9]*)$", "\\1",
#                           columns[grep("-", columns[,1], invert = TRUE), 1])
#
#   columns$second <- gsub(".*-(.*)|", "\\1", columns[,1])
#   columns$name <- gsub("(.*) .*", "\\1", columns[,1])
# }
