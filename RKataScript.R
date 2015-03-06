kataBasic <- function(int1,int2)
{
  multis <- vector()
  nextD <- int1
  nextM <- int2
  divides <- while(nextD > 1) 
  {
    nextD <- trunc(nextD / 2);
    nextM <- nextM*2;
    if (nextD %% 2 == 1){
      multis <- append(multis,nextM);
    }
  } ##end of while
  return(sum(multis))
}

kataBasic(140,203)