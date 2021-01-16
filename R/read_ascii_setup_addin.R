#' @title
#' Launch an RStudio addin to select options for read_ascii_setup()
#' @description
#' Launch an RStudio addin to select options for read_ascii_setup().
#' @return
#' read_ascii_setup() code to console with options based on user input
#' @export
#' @examples
#' \dontrun{
#' read_ascii_setup_addin()
#' }
read_ascii_setup_addin <- function() {


  ui <- miniUI::miniPage(

    ## Your UI items go here.
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel(miniUI::gadgetTitleBar("Read fixed-width ASCII file using SPSS or SAS Setup file"),
                           miniUI::miniContentPanel(
                             shiny::fillRow(
                               shiny::fillCol(
                                 shiny::textInput("new_data_name", label = shiny::h5("Select data name")),
                                 shiny::fluidRow(shiny::column(3, shiny::verbatimTextOutput("new_data_name"))),
                                 shiny::fileInput("data", label = shiny::h5("Data file input (.txt or .dat)")),
                                 shiny::fluidRow(shiny::column(4, shiny::verbatimTextOutput("data"))),
                                 shiny::fileInput("setup", label = shiny::h5("Setup file input (.sps or .sas)")),
                                 shiny::fluidRow(shiny::column(4, shiny::verbatimTextOutput("setup")))),
                               shiny::fillCol(
                                 shiny::checkboxInput("value_labels", label = shiny::h5("Use value labels"),
                                                      value = TRUE),
                                 shiny::checkboxInput("clean_names", label = shiny::h5("Use clean names"),
                                                      value = TRUE),
                                 shiny::checkboxInput("coerce_numeric", label = shiny::h5("Coerce numeric columns"),
                                                      value = TRUE),
                                 shiny::textInput("columns", label = shiny::h5("Select columns"),
                                                  placeholder = "Optional - select specific columns")
                               ))
                           )
      )
    )
  )

  # Server code for the gadget.
  server <- function(input, output, session) {

    shiny::observeEvent(input$done, {
      shiny::req(input$data)
      shiny::req(input$setup)
      shiny::req(input$new_data_name)

      if (input$columns == "") {
        select_columns_temp <- "NULL"
      } else {
        select_columns_temp <- input$columns
      }

      data_path <- input$data$name
      data_path <- gsub("\\\\", "/", data_path)
      setup_path <- input$setup$name
      setup_path <- gsub("\\\\", "/", setup_path)

      rstudioapi::sendToConsole(paste0(input$new_data_name,
                                       " <- read_ascii_setup(data = '",
                                       data_path,
                                       "', setup_file = '",
                                       setup_path,
                                       "', use_value_labels = ",
                                       input$value_labels,
                                       ", use_clean_names = ",
                                       input$clean_names,
                                       ", select_columns = ",
                                       select_columns_temp,
                                       ", coerce_numeric = ",
                                       input$coerce_numeric, ")"))

      shiny::stopApp()
    })
  }

  # Use a modal dialog as a viewr.
  viewer <- shiny::dialogViewer("Ascii Setup Reader")
  shiny::runGadget(ui, server, viewer = viewer)
}
