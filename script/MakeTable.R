# library
library(gridExtra) 
library(grid)

### main
cairo_pdf(file="test1.pdf") # 名前は随時変更
grid.draw(tableGrob(head(result,15))) # 対象となるdata.frame
dev.off()
getwd()
###

### データフレーム操作
aaa<- t(result) %>% # 転置
  as.data.frame()

# apply使いましょう
aaa$error.te1 %>% unlist() -> aaa$error.te1
aaa$error.te2 %>% unlist() -> aaa$error.te2
aaa$error.te3 %>% unlist() -> aaa$error.te3
aaa$error.te4 %>% unlist() -> aaa$error.te4
aaa$error.tr1 %>% unlist() -> aaa$error.tr1
aaa$error.tr2 %>% unlist() -> aaa$error.tr2
aaa$error.tr3 %>% unlist() -> aaa$error.tr3
aaa$error.tr4 %>% unlist() -> aaa$error.tr4

# 行列データの桁数を一気に調整する
aaa <- apply(aaa, MARGIN = c(1,2), format, digits=3) %>% as.data.frame() 

