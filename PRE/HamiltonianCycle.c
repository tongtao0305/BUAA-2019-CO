#include<stdio.h>

int n, m, sum = 0, start = 0, count = 0;
int graph[8][8];
int visited[8];

void hamilton(int x0) {
	int i;
	if (sum == n-1 && graph[x0][start] == 0) {
		count++;
		return;
	}
	for (i = 0; i < n; i++) {
		if (graph[x0][i] == 0 && visited[i] == 0) {
			sum++;
			visited[i] = 1;
			hamilton(i);
			visited[i] = 0;
			sum--;
		}
	}
	return;
}

int main(void) {
	int i, j, k, a, b;
	scanf("%d %d", &n, &m);

	//��visited��graph���г�ʼ�� 
	for (i = 0; i < n; i++) {
		visited[i] = 0;
		for (j = 0; j < n; j++) {
			graph[i][j] = 1;
		}
	}

	//����graph 
	for (i = 0; i < m; i++) {
		scanf("%d %d", &a, &b);
		graph[a-1][b-1] = 0;
		graph[b-1][a-1] = 0;
	}
	visited[start] = 1;

	hamilton(start);
	printf("%d", count/2);

	return 0;
}
