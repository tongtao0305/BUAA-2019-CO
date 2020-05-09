#include<stdio.h>

int main(void){
	int n,m,temp,i,j,count=-1;
	int num[2500],row[2500],column[2500]; 
	
	scanf("%d %d",&n,&m);
	
	for (i=0;i<n;i++){
		for (j=0;j<m;j++){
			scanf("%d",&temp);
			if (temp!=0){
				count++;
				num[count]=temp;
				row[count]=i+1;
				column[count]=j+1;	
			}
		}
	}
	
	for (i=count;i>=0;i--){
		printf("%d %d %d\n",row[i],column[i],num[i]);
	}
	
	return 0;
}
