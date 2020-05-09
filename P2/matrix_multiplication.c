#include<stdio.h>

int main(void){
	int n,i,j,k;
	int matrix1[10][10],matrix2[10][10],matrix3[10][10];
	//读取矩阵的大小 
	scanf("%d",&n);
	//读取第一个矩阵 
	for (i=0;i<n;i++)
		for (j=0;j<n;j++)
			scanf("%d",&matrix1[i][j]);
	//读取第二个矩阵 
	for (i=0;i<n;i++)
		for (j=0;j<n;j++)
			scanf("%d",&matrix2[i][j]);	
	//计算第三个矩阵 
	for (i=0;i<n;i++){
		for (j=0;j<n;j++){
			matrix3[i][j]=0;
			for (k=0;k<n;k++){
				matrix3[i][j]+=matrix1[i][k]*matrix2[k][j];	
			}
		}
	}
	//输出第三个矩阵		
	for (i=0;i<n;i++){ 
		for (j=0;j<n;j++)
			printf("%d ",matrix3[i][j]);
		printf("\n");
	}
	
	return 0;
}
