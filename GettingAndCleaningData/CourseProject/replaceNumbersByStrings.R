df1 <- data.frame(col1=seq(1,10,2), col2=letters[1:5])
df2 <- data.frame(stuff=c(3,3,5,9,1,1,1,5))
# for (i in 1:nrow(df2)){
#   df2$stuff[i] <- as.character(df1$col2[df1$col1==df2$stuff[i]])
# }

df2$stuff <- df1[match(df2$stuff, df1$col1), 2, drop=T]
