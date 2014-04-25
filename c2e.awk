#test for user's input
awk '
BEGIN {
          while( getline < ARGV[1]) {
               English[++n] = $1
               Chinese[n] = $2
          }
          ARGV[1] = "-"
          srand()
          question()
      }
      {
	  if($1 != English[ind])
            print "Try again!"
          else
	  {
	     print "\nYou are right"
	     getline
             question()
          }
      }

function question(){
      ind = int(rand()*n) + 1
      system("clear")
      print "Press \"ctrl-d\" to exist"
      printf("\n%s",Chinese[ind] " lower is ")
}
' $*
