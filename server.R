#------------------------------------------------------------------------------------------#
# Building a shinny app for UDpipe workflow #
#------------------------------------------------------------------------------------------#



server <- function(input, output, session) {
  x <- reactive({
    req(input$file1)
    fi<-input$file1
    text <- readLines(fi$datapath)
    print(text)
    req(input$model)
    mod<-input$model
    print(mod)
    ud_model<-udpipe_load_model(mod$datapath)
    x <- udpipe_annotate(ud_model, x = text) #%>% as.data.frame() %>% head()
    x <- as.data.frame(x)
    return(x)
  })
  sub<-reactive({
    x<-x()
    print(input$POS)
    sub<-subset(x,xpos %in% input$POS)
    print(sub)
    return(sub)
  })
  output$cooc<-renderPlot({
    sub=sub()
    View(sub)
    cooc <- cooccurrence(x=sub,
                         term = "lemma", 
                         group = c("doc_id", "paragraph_id", "sentence_id"))  # 0.02 secs
    wordnetwork <- head(cooc,input$max)
    wordnetwork <- igraph::graph_from_data_frame(wordnetwork) # needs edgelist in first 2 colms.
    
    ggraph(wordnetwork, layout = "fr") +  
      
      geom_edge_link(aes(width = cooc, edge_alpha = cooc), edge_colour = "orange") +  
      geom_node_text(aes(label = name), col = "darkgreen", size = 4) +
      
      theme_graph(base_family = "Arial Narrow") +  
      theme(legend.position = "none") +
      
      labs(title = "Cooccurrences within 3 words distance", subtitle = "Nouns & Adjective")
  })
  
}
shinyApp(ui = ui, server = server)
