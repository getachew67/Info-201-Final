#Require shiny

library(shiny)
library(shinythemes)

#Define the functionality of the user interface
shinyUI(fluidPage(
  
  theme = shinytheme("darkly"),
  
  # Add a descriptive application title
  titlePanel("Crypto Correlation"),
  
  # Add the app interactivity
  sidebarLayout(
    sidebarPanel(
      tags$style(type="text/css",
                 ".shiny-output-error { visibility: hidden; }",
                 ".shiny-output-error:before { visibility: hidden; }"
      ),
      #selectInput Manufacturer #inputID = Manufacturer
      selectInput(inputId = "currency",
                  label = "Currency:",
                  choices = c("Bitcoin (BTC)", "Ethereum (ETH)", "Ripple (XRP)", "Bitcoin Cash (BCH)", "Litecoin (LTC)", "All"),
                  selected = "All"),
      
      radioButtons("radio",
                   label = "Volume Indicator:",
                   choices = c("Google Search Volume (percentile rank)", "Trade Volume (quantity of trades)"),
                   selected = "Trade Volume (quantity of trades)"
      ), 
      
      radioButtons("radio2",
                   label = "Volume Chart Format:",
                   choices = c("Bar Graph", "Plot line"),
                   selected = "Bar Graph"
      )
      
      # ,radioButtons("radio3",
      #              label = "Display Crypto News Updates?",
      #              choices = c("Yes", "No"),
      #              selected = "Yes"
      # )
      
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Summary",
                 h3("Google Search Activity vs. Cryptocurrency Prices: Is there a pattern here?"),
                 p("Our group wanted to look at the relation of Google keyword search and historical cryptocurrency market prices 
                   had on each other. We pulled data resources from various users and locations, cleaned that dataset to fit our 
                   study, then hosted our visualizations as shiny app. To answer the question of whether or not higher query 
                   hits of cryptocurrency keywords relates to a higher crypto- market value, we built a visualization containing 
                   two types of graphs and a filtering section to match the focus of our study and our users."),
                 
                 h3("Two type of visualization and what they mean"),
                 p("The graph on the top shows the average close price for the chosen cryptocurrency per week. Based on the users
                   choice of the top 5 cryptocurrencies (or all of them), you will aslo be able to see the high(max) and low(min)
                   values for the week as well. You can see this when looking at the the lines that look similar to the whiskers 
                   of each point. This was interesting because you can see some very extreme variation in price every week, exposing
                   just how volatile some of these cryptocurrencies can be at any given time. The graph below this shows the search
                   and trade value. Search volume is referring to the search hits a chosen cryptocurrency would recieve and trade 
                   volume is the amount of trades that happened during that week for a chosen cryptocurrency. Using the filter widget
                   on the left side of the application under the graph tab will allow you to dynamically manipulate the output of the 
                   visualization. Try it out!"),
                 
                 h3("The Data Tab"),
                 p("When clicking on the 'Data' tab, you will be presented with the raw data that was used to create our visualizations
                   and conduct out study. Just like the graph visualizations, you can use the various tools that are under this to 
                   rearrange the data. On the top right, you can see a search input area where you can put in a query for a specific 
                   cryptocurrency. Above each column, you will see the column headers that are clickable to change the ordering of the 
                   records in that column. You can also look through our paginated data by clicking a page number, next or previous 
                   located under the data table."),
                
                 h3("Data Sources"),
                 p("We used data from GitHub user JesseVent's \"crypto\" repository, which containeds historical cryptocurrency 
                   prices and market data for all different cryptocurrency tokens. The dataset includes 1515 different coins, 
                   13 variables, and over 700,000 observations with dates from 2013 until now. We downloaded the crypto history 
                   data through R using a custom function provided by the development library from the developer. Additionally, 
                   we used Google Trends data related to our selected cryptocurrencies. We then pulled all of the data ranging back 
                   to the start of 2017, as cryptocurrency activity has been more prominent (and arguably more interesting) recently 
                   than ever before, due to rising popularity and a heightened sense of legitimacy from the public."),
                 
                 h3("Findings"),
                 p("As one may expect, we found that cryptocurrency prices varied very consistently with both search volume 
                   and trade volume. This is evident when one examines the graphs for each of the different cryptocurrencies. 
                   It is difficult to say whether this correlation is accompanied by any sort of direct causation between the 
                   two variables, because there arguments for causation in both directions. For example, one may argue that a 
                   rising cryptocurrency price would likely lead to increased news headlines mentioning the cryptocurrency, 
                   and the large public exposure generated by such headlines would surely induce an uptick in search queries 
                   containing the cryptocurrency. On the other hand, rising search query volume could very well inflate 
                   cryptocurrency prices because such increased popularity could be viewed as an increase in public perception 
                   and be marked as an indicator for a price rise."),
                 
                 h3("Where we got our data"),
                 a(href="https://www.kaggle.com/jessevent/all-crypto-currencies", "Hystorical Cryptocurrency Dataset - Kaggle"),
                 p(),
                 a(href="https://trends.google.com/trends/", "Google Trends API"),
                 
                 h3("GitHub Repo Link to Final Project"),
                 a(href="https://github.com/andrewmahoneyf/Info-201-Final", "BA - PAJJ / Final Project")
        ),
        tabPanel("Data", dataTableOutput("description")),
        tabPanel("Crypto Plot",
                 fluidRow(
                   verbatimTextOutput("info"),
                   plotOutput("coinPlot",  click = "plot_click"),
                   plotOutput("coinPlot2"))
        )
      )
    )
    
  )
))