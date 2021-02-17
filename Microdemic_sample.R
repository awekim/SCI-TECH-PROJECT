#######################################################################
##  Made by: Dr. Keungoui Kim
##  Title: Using microdemic to pull MAG data
##  goal : 
##  Data set: Microsoft Academic Graph
##  Time Span: 
##  Variables
##      Input: 
##      Output:  
##  Methodology: 
##  Time-stamp:   
##  Notice :

### Step 1. Install and load package
# install.packages('microdemic')
library(microdemic)
library(dplyr) # for dplyr functions

### Step 2. Get MAG Key
# Go to the following web-site, register and get API key
https://msr-apis.portal.azure-api.net/

### Step 3. Set API keys
api.key <- "COPY-AND-PASTE-YOUR-API-KEY-HERE"

### Step 4. Pull data
# Everytime you run microdemic, copy and paste api.key that you received.

# Example 1) Get basic information about publications that were published in year 2020 (select 20)
# Ti: Normalized title
# Y: Year
# CC: Citation count
# J.JN: Journal name
ma_evaluate(query = "Y=2020", count = 20, key=api.key) 

# Example 2) Receive abstract of publications that were published in year 2020 (select 20)
ma_abstract(query = "Y=2020", count = 20, key=api.key)

# Example 3) Interpret
# The Interpret method generates semantic interpretations of a natural language query.
# It can be used as either a way of interpreting a specific natural language query, 
# or to generate natural language query suggestions using the original query as a stem.
res <- ma_interpret(query = "COVID-19'...", key=api.key)
head(res)
res$query
res$interpretations
res$interpretations$parse
res$interpretations$rules
res$interpretations$rules[[1]]
expr <- res$interpretations$rules[[1]]$output.value
ma_evaluate(expr, count=100,key="8efda67ae5744d28ba49074f5c4994df")

# Example 4) Query components of a composite attribute
ma_evaluate(query = "Composite(And(AA.AuN='mike smith',AA.AfN='harvard university'))", count = 20, 
            key="8efda67ae5744d28ba49074f5c4994df")

# Example 5) Calculate histogram 
res <- ma_calchist(query = "And(Composite(AA.AuN=='keungoui kim'),Y>=2017)", atts = c('Y', 'F.FN', 'J.JN'), key=api.key) 
res$histograms$histogram

### You can find the detail informations from the links below
https://docs.ropensci.org/microdemic/index.html
https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/
https://msr-apis.portal.azure-api.net/docs/services/academic-search-api/operations/565d9001ca73072048922d97  

  