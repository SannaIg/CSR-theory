#CSR green house data
CSR <- read_csv2("CSR_simple.csv", col_names = T)

#Calculate means

CSR %>% group_by(species) %>% summarise(c=mean(c), 
                                        s=mean(s),
                                         r=mean(r)) -> CSR_means

#Create interactive ternary CSR plot                                                                           
CSRmeans_plot <- CSR_means %>% 
  plot_ly() %>% add_trace(type = 'scatterternary',mode = 'markers', 
                          a = (CSR_means~c),
                          b = (CSR_means~r),
                          c = (CSR_means~s),
                          text = (CSR_means~species),
                          marker = list( 
                            symbol = 100,
                            size = 10,
                            color= c ("red","blue","green","grey","black","yellow","orange","pink","purple","brown","magenta") 
                            [as.numeric(as.factor(CSR_means$species))+1],
                            line = list('width' = 2))) %>%
  layout(    ternary = list(
    aaxis = list(title = "C"),
    baxis = list(title = "R"),
    caxis = list(title = "S")))

CSRmeans_plot    
