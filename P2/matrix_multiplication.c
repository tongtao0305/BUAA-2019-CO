#include<stdio.h>

int main(void){
	int n,i,j,k;
	int matrix1[10][10],matrix2[10][10],matrix3[10][10];
	//��ȡ����Ĵ�С 
	scanf("%d",&n);
	//��ȡ��һ������ 
	for (i=0;i<n;i++)
		for (j=0;j<n;j++)
			scanf("%d",&matrix1[i][j]);
	//��ȡ�ڶ������� 
	for (i=0;i<n;i++)
		for (j=0;j<n;j++)
			scanf("%d",&matrix2[i][j]);	
	//������������� 
	for (i=0;i<n;i++){
		for (j=0;j<n;j++){
			matrix3[i][j]=0;
			for (k=0;k<n;k++){
				matrix3[i][j]+=matrix1[i][k]*matrix2[k][j];	
			}
		}
	}
	//�������������		
	for (i=0;i<n;i++){ 
		for (j=0;j<n;j++)
			printf("%d ",matrix3[i][j]);
		printf("\n");
	}
	
	return 0;
}
