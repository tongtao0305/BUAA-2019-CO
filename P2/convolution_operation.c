#include<stdio.h>

int main(void){
	int m1,m2,n1,n2,matrix1[10][10],matrix2[10][10],matrix3[10][10],matrix4[10][10];
	int i,j,k,l,temp;
	
	//��ȡ���������;���� 
	scanf("%d %d",&m1,&n1); 
	scanf("%d %d",&m2,&n2);	
	for (i=0;i<m1;i++)
		for (j=0;j<n1;j++)
			scanf("%d",&matrix1[i][j]);
	for (i=0;i<m2;i++)
		for (j=0;j<n2;j++)
			scanf("%d",&matrix2[i][j]);	
	/* 
	//��ת����˲��������¾����� 
	for (i=0;i<m2;i++)
		for (j=0;j<n2;j++)
			matrix3[i][j]=matrix2[m2-1-i][n2-1-j];
	//��ӡ��ת��ľ�����Լ�����ȷ�� 
	for (i=0;i<m2;i++){
		for (j=0;j<n2;j++)
			printf("%d ",matrix3[i][j]);
		printf("\n");
	}
	*/ 
	
	for (i=0;i<m1-m2+1;i++){
		for (j=0;j<n1-n2+1;j++){
			temp=0;
			for (k=0;k<m2;k++){
				for (l=0;l<n2;l++){
					temp += matrix1[i + k][j + l] * matrix2[k][l];
				}
				matrix4[i][j]=temp;
			} 
			//printf("%d",temp); 
		}
	}
	
	for (i=0;i<m1-m2+1;i++){
		for (j=0;j<n1-n2+1;j++){
			printf("%d ",matrix4[i][j]);
		}
		printf("\n");
	}
	
	return 0;
} 
