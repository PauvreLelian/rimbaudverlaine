

library(tidyverse)
library(visNetwork)


nodes <- read.csv("Rimbaud-NODES.csv", header=T, as.is=T)
links <- read.csv("Rimbaud-EDGES.csv", header=T, as.is=T)

links <- links %>% 
  left_join(select(nodes, name, id), by = c("from" = "id")) %>% 
    rename(from_name = name) %>% 
      left_join(select(nodes, name, id), by = c("to" = "id")) %>% 
        rename(to_name = name)


vis.nodes <- nodes
vis.links <- links

vis.nodes$shape  <- "dot"  
vis.nodes$shadow <- TRUE 
vis.nodes$title  <- vis.nodes$name # Text on click
vis.nodes$label  <- vis.nodes$name 
vis.nodes$size   <- 25 
vis.nodes$borderWidth <- 2 

vis.nodes$group = vis.nodes$type.label

vis.nodes$color.background <- c("gold", 
                                "seagreen", 
                                "darkorchid", 
                                "steelblue", 
                                "coral",
                                "pink")[nodes$group.type]

vis.nodes$color.border <- "black"
vis.nodes$color.highlight.background <- "orange"
vis.nodes$color.highlight.border <- "darkred"

# change edge text to include info on from and to

vis.links$title <- paste0(vis.links$from_name, " ", vis.links$type, " ", vis.links$to_name)

visnet <- visNetwork(vis.nodes, vis.links) %>%  
  visEdges(arrows = "to", color = list(highlight = "darkred"))

visLayout(
  visnet,
  randomSeed = TRUE,
  improvedLayout = TRUE,
  hierarchical = TRUE
) 
 


visPhysics(visnet,
  repulsion = list(
    # Negative value for repulsion
    gravitationalConstant = -50000,
    # Adjust for desired spacing
    springLength = 1000,
    # Stronger spring for tighter network
    springConstant = 0.001
  )  
)  
  


visOptions(visnet, 
           selectedBy = "group",
           highlightNearest = list(enabled = TRUE, 
                                   degree = 1,
                                   hideColor = "rgba(0,0,0,0.05)",
                                   labelOnly = FALSE, 
                                   hover = TRUE,
                                   algorithm="hierarchical",
                                   degree=list(from=1, to=1)
                                   ) 
           )


