kataBasic <- function(int1,int2)
{
  signs <- sign(int1)*sign(int2)
  multis <- vector()
  nextD <- abs(int1)
  nextM <- abs(int2)
  divides <- while(nextD > 1) 
  {
    nextD <- trunc(nextD / 2);
    nextM <- nextM*2;
    if (nextD %% 2 == 1){
      multis <- append(multis,nextM);
    }
  } ##end of while
  return(signs*sum(multis))
}

kataBasic(-10,-20)
