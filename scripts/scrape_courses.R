
install.packages("rvest")

library(tidyverse)
library(rvest)

# Scraping data from multiple pages:
# ... http://bulletin.gwu.edu/courses/emse/
# ... http://bulletin.gwu.edu/courses/csci/

subjects <- c("EMSE", "CSCI")

for(subject in subjects){
    cat("----------------------", "\n")
    cat(subject)
    
    request_url <- paste("http://bulletin.gwu.edu/courses/", tolower(subject), sep="")
    page <- read_html(request_url)
    
    course_divs <- page %>% html_nodes(".courseblock")
    for(div in course_divs){
        cat("---", "\n")
        
        title_block <- div %>% html_node(".courseblocktitle")  %>% html_text()
        cat(title_block, "\n")
        #> EMSE 6845. Lean and Agile Systems Engineering. 3 Credits.
        # TODO: split on period, get course_id, course_title, n_credits

        desc_block <- div %>% html_node(".courseblockdesc") %>% html_text()
        cat(desc_block, "\n")
        #> Lean and agile methods as applied to the engineering design and development of systems; review of contemporary implementation frameworks, methodologies, and the tools used to support them. Implications for traditional systems engineering; fundamental changes to the requirements processes; implications for engineering management. Prerequisite:

    } 
}

# TODO: collect all the courses into a single dataframe!
