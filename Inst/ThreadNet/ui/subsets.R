tabPanel(value = "subsets",
    "Clusters and Chunks",
    helpText('This tab contains functions that are under development and may break. Your feedback will be appreciated.'),
    tags$hr(),
    tabsetPanel(
        type = "tabs",
        tabPanel(
            "Contextual Chunks",
            helpText('Recode sequences into chunks.  This reduces the length of the sequences.'),
            tags$hr(),
            fluidRow(
                column(3, uiOutput("chunk_controls_0")),
                column(3,
                    # add method for RLE -- remove sequential runs
                    radioButtons(
                        "Chunks_method_Button",
                        label = h4("Choose method for chunking:"),
                        choices = c( "Changes", "Time Gap","Fixed Size"),
                        inline=TRUE
                    ),
                    conditionalPanel(
                        condition = "input.Chunks_method_Button == 'Changes'",
                        uiOutput("chunk_controls_2")
                    ),
                    conditionalPanel(
                        condition = "input.Chunks_method_Button == 'Time Gap'",
                        uiOutput("chunk_controls_3")
                    ),
                    conditionalPanel(
                        condition = "input.Chunks_method_Button == 'Fixed Size'",
                        uiOutput("chunk_controls_4")
                    )
                ),
                column(3, uiOutput("chunk_controls_5"))
            ),
            uiOutput("chunk_controls_1"),
            uiOutput("chunk_controls_6"),
            verbatimTextOutput("chunk_controls_7")
        ),

        tabPanel(
            "Cluster for Zooming",
            helpText('Not all POVs work with all kinds of clustering. If it works, this function will replace the existing clustering on the POV.'),
            tags$hr(),
            fluidRow(
                column(3,uiOutput("Cluster_Event_controls_1") ),
                column(3,uiOutput("Cluster_Event_controls_2") ),
                column(3,uiOutput("Cluster_Event_controls_3") )
            ),
            dendroNetworkOutput("dendroClusterResult")
        ),


        tabPanel(
            "Find/replace patterns",
            helpText('Find/replace frequently occurring n-grams with the label of your choice.  Replacement operates on the text in the window.'),
            tags$hr(),
            fluidRow(
                column(3, uiOutput("Frequent_Ngram_controls_1")),
                column(3, uiOutput("Frequent_Ngram_controls_2"),
                uiOutput("Frequent_Ngram_controls_21")),
                column(3, uiOutput("Frequent_Ngram_controls_7"))
            ),
            uiOutput("Frequent_Ngram_controls_3"),
            verbatimTextOutput("Frequent_Ngram_controls_4"),
            tags$h4("Select patterns by clicking on the table:"),
            DT::dataTableOutput("freqnGramTable")
        ),

        tabPanel(
            "Input your pattern",
            helpText('Enter your own patterns to replace with the label of your choice.  Replacement operates on the text in the window.'),
            tags$hr(),
            fluidRow(
                column(3, uiOutput("Regular_Expression_controls_1")),
                column(3, uiOutput("Regular_Expression_controls_2")),
                column(3, uiOutput("Regular_Expression_controls_7"))
            ),
            uiOutput("Regular_Expression_controls_3"),
            verbatimTextOutput("Regular_Expression_controls_4"),
            uiOutput("Regular_Expression_controls_5"), # how many rows?
            uiOutput("Regular_Expression_controls_6")
        ),

        tabPanel(
          "Select Subset of POV",
          helpText('Select and save a subset of data for comparison (again)'),
          tags$hr(),
          fluidRow(
            column(3, uiOutput("SelectSubsetControls_1")),
            column(3, uiOutput("SelectSubsetControls_2")) ),
          DT::dataTableOutput("SelectSubsetDataTable")
        ),

        tabPanel(
            "Export and delete POV maps",
            helpText('Delete or export event maps'),
            tags$hr(),
            uiOutput("Manage_Event_Map_controls"),
            verbatimTextOutput("action_confirm")
        )
    )
)
