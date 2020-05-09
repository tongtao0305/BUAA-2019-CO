#include<stdio.h>

int main(void){
	int i,n,count,flag=1;
	int string[50];
	
	scanf("%d",&n);
	
	for (i=0;i<n;i++){
		scanf("%d",&string[i]);
	}
	
	for (i=0;i<n;i++){
		if (string[i]!=string[n-1-i])
			flag=0;
	}
	
	printf("%d",flag);
	
	return 0;
}
