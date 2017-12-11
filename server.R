read.data <- function(){
  read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8", check.names=FALSE)
}
data <- read.data()
colors <- c("#750db1", "#1dc87a", "#FF1493", "#FF4500", "#FFFF00", "#0000FF")
draw_ <- function(costss, j){
  index <- 0
  for(i in 1:nrow(data)){
    if(data[i, 1] == costss[j]){
      index <- i
    }
  }
  if(index == 0){
    return()
  }
  if(j == 1){
    print(data[1, 2:13])
    plot(2:13, data[index, 2:13], type = "o", xaxt = "n",xlab = "Час", ylab = "Ціна", col = colors[j], ylim = c(15000,22000))
    axis(1, at = 1:length(data), labels = colnames(data))
  } else {
    lines(2:13, data[index, 2:13], type = "o", xaxt = "n", xlab = "Час", ylab = "Ціна", col = colors[j])
  }
  legend("topright", legend = costss, col = colors, lty = 1)
}
draw <- function(costss){
  if(is.null(costss)){
    return()
  }
  for(i in 1:length(costss)){
    draw_(costss, i)
  }
}
shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$cost)
    })
  }
)