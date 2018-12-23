#--------------------------------------------------------#
#Building Shinny app for UDpipe
#
#
#
#Member 1: Navya Yerrabochu  PGID:11810063
#Member 2: Akhilesh Karamsetty Venkata Subba  PGID:11810115
#----------------------------------------------------------#

try(require(shiny) || install.packages("shiny"))
if (!require(shinydashboard)){install.packages("shinydashboard")}
if (!require(shinythemes)){install.packages("shinythemes")}
if (!require(udpipe)){install.packages("udpipe")}
if (!require(textrank)){install.packages("textrank")}
if (!require(lattice)){install.packages("lattice")}
if (!require(igraph)){install.packages("igraph")}
if (!require(ggraph)){install.packages("ggraph")}
if (!require(wordcloud)){install.packages("wordcloud")}


library(shiny)
library(shinydashboard)
library(shinythemes)
library(udpipe)
library(udpipe)
library(textrank)
library(lattice)
library(igraph)
library(ggraph)
library(ggplot2)
library(wordcloud)
library(stringr)