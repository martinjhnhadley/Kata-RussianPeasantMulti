kataBasic <- function(int1,int2)
{
  signs <- sign(int1)*sign(int2)
  nextD <- abs(int1)
  nextM <- abs(int2)
  multis <- ifelse(int1 %% 2==1,c(nextM),c(0))
  while(nextD > 1) 
  {
    nextD <- trunc(nextD / 2);
    nextM <- nextM*2;
    if (nextD %% 2 == 1){
      multis <- append(multis,nextM);
    }
  } ##end of while
  return(signs*sum(multis))
}

kataBasic(-20,5)

