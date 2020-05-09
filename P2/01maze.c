#include<stdio.h>

int count = 0;	//ȫ�ֱ���ͳ��·������ 
int visited[7][7];	//ȫ�ֱ���ͳ�ƽڵ��Ƿ񱻷��ʹ� 
int startx, starty, endx, endy;
int n, m, map[7][7];

void maze(int x0, int y0) {
	int x, y;
	if (x0 == endx && y0 == endy) {
		count++;
		return;
	}
	//�ϱ߽ڵ� 
	if (x0 > 0 && visited[x0 - 1][y0] == 0 && map[x0-1][y0]==0) {
		visited[x0 - 1][y0] = 1;
		maze(x0 - 1, y0);
		visited[x0 - 1][y0] = 0;
	}
	//��߽ڵ� 
	if (y0 > 0 && visited[x0][y0 - 1] == 0  && map[x0][y0 - 1] == 0) {
		visited[x0][y0 - 1] = 1;
		maze(x0, y0 - 1);
		visited[x0][y0 - 1] = 0;
	}
	//�±߽ڵ� 
	if (x0 < n-1 && visited[x0 + 1][y0] == 0 && map[x0 + 1][y0] == 0) {
		visited[x0 + 1][y0] = 1;
		maze(x0 + 1, y0);
		visited[x0 + 1][y0] = 0;
	}
	//�ұ߽ڵ� 
	if (y0 < m-1 && visited[x0][y0 + 1] == 0 && map[x0][y0 + 1] == 0) {
		visited[x0][y0 + 1] = 1;
		maze(x0, y0 + 1);
		visited[x0][y0 + 1] = 0;
	}

	return;
}


int main(void) {
	int i, j, k;
	scanf("%d %d", &n, &m);
	for (i = 0; i < n; i++)
		for (j = 0; j < m; j++) {
			visited[i][j] = 0;
			scanf("%d", &map[i][j]);
		}	
	scanf("%d %d %d %d", &startx, &starty, &endx, &endy);
	visited[startx][starty] = 1;
	maze(startx, starty);
	printf("%d", count);
	return 0;
}
