import java.util.Scanner;

public class GridPath {
    public static final int mod = 1000000007;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the size of the matrix: ");
        int n = sc.nextInt();
        int m = sc.nextInt();

        int[][] grid = new int[n + 1][m + 1];
        System.out.println("Enter the matrix: ");
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                grid[i][j] = sc.nextInt();
            }
        }

        int[][] h = new int[n + 1][m + 1];
        
        // Initializing the starting point
        if (grid[1][1] == 1) {
            h[1][1] = 1;
        }

        // Fill the DP table
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (grid[i][j] == 1) {
                    if (i > 1) {
                        h[i][j] = (h[i][j] + h[i - 1][j]) % mod;
                    }
                    if (j > 1) {
                        h[i][j] = (h[i][j] + h[i][j - 1]) % mod;
                    }
                }
            }
        }

        System.out.println(h[n][m]);
    }
}
