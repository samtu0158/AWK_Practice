#test for recursive function
awk '
BEGIN {
	print "input :"
	getline
	permutation($0, "")
	printf("\n total count is %d\n",count)
      }

function permutation(main_lst, buffer, new_main_lst, nf, i, j) {
	$0 = main_lst
	nf = NF

	#for single item
	if(nf==1){
		print buffer main_lst
		count++
		return
	}
	#for item count >=2
	else for(i=1;i<=nf;i++){
		$0 = main_lst
		new_main_lst = ""
		for(j=1;j<=nf;j++)
			if(j!=i) new_main_lst = new_main_lst " "$j
		permutation(new_main_lst, buffer " " $i)
	}
}

' $*
