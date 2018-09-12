library(shiny)
library(shinyAce)

modes <- getAceModes()
themes <- getAceThemes()

shinyUI(fluidPage(
  title = 'Tidy R Code',
  helpText(),  # just a placeholder for a little bit top margin
  sidebarLayout(
    sidebarPanel(
      titlePanel("cleanR-FazDev v1.1")
        ,hr(),
      tags$head(
        tags$script(src = 'shiny-handler.js'),
        tags$style(type = 'text/css', '.popover {max-width: 100%;}')
      ),
      helpText('This Shiny app uses the function', code('tidy_source()'),
               'in the formatR package',
               sprintf('(>= v%s)', packageVersion('formatR'))
               # a(list(icon('hand-o-right'), 'demo'), class = 'btn btn-small btn-info',
               #   onclick = '$("textarea#src").val($("#demo").val()).trigger("change");')
               ),
      HTML("package to reformat R code in the text box on the right.<br/>1. long lines of code and comments are reorganized into appropriately shorter ones<br/>2. spaces and indent are added where necessary<br/>3. comments are preserved in most cases<br/>4. the number of spaces to indent the code (i.e. tab width) can be specified (default is 4)<br/>5. an else statement in a separate line without the leading } will be moved one line back
= as an assignment operator can be replaced with <-<br/>6. the left brace { can be moved to a new line"),
      checkboxInput('arg_comment', 'Preserve comments', TRUE),
      checkboxInput('arg_blank', 'Preserve blank lines', TRUE),
      checkboxInput('arg_assign', 'Replace = with <-', FALSE),
      checkboxInput('arg_brace', 'Put { on a new line', FALSE),
      numericInput ('arg_indent', 'Number of spaces for indentation', 2, min = 0),
      numericInput ('arg_width', 'Minimum line width', 80, min = 20, max = 500),
      # selectInput("mode", "Mode: ", choices=modes, selected="plain_text"),
      # selectInput("theme", "Theme: ", choices=themes, selected="textmate"),
      br(),
      # actionButton("reset", "Reset Text"),hr(),
      submitButton ('Tidy My Code', icon('toggle-right'))
    ),
    mainPanel(
      h4("Paste the untidy R code below"),
      # tags$textarea(
      #   id = 'src', rows = 40,
      #   style = 'width: 99%; font-family: monospace; word-wrap: normal; white-space: pre;',
      #   placeholder = 'paste your R code here...'
      # ),
      # aceEditor("src", mode="r", value=""),
      aceEditor("src", value="", height = "650px", wordWrap = TRUE, theme="monokai", mode="r")


#       aceEditor(outputId, value, mode, theme, vimKeyBinding = FALSE,
#   readOnly = FALSE, height = "400px", fontSize = 12, debounce = 1000,
#   wordWrap = FALSE, showLineNumbers = TRUE, highlightActiveLine = TRUE,
#   selectionId = NULL, cursorId = NULL, hotkeys = NULL,
#   autoComplete = c("disabled", "enabled", "live"), autoCompleteList = NULL)
# }
    )
  )
))