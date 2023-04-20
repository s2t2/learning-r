
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
    
    page <- read_html(paste("http://bulletin.gwu.edu/courses/", tolower(subject), sep=""))
    course_divs <- page %>% html_nodes(".courseblock")
    
    for(div in course_divs){
        cat("---", "\n")
        title_block <- div %>% html_node(".courseblocktitle")  %>% html_text()
        #> EMSE 6845. Lean and Agile Systems Engineering. 3 Credits.
        cat(title_block, "\n")
        # TODO: split on period, get course_id, course_title, n_credits
        
        desc_block <- div %>% html_node(".courseblockdesc") %>% html_text()
        #> Lean and agile methods as applied to the engineering design and development of systems; review of contemporary implementation frameworks, methodologies, and the tools used to support them. Implications for traditional systems engineering; fundamental changes to the requirements processes; implications for engineering management. Prerequisite:
        cat(desc_block, "\n")
    } 
}
