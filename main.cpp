#include <iostream>
#include <vector>
#include <string>

using namespace std;

struct Delta {
    int dr, dc;
};

Delta get_delta(char ch) {
    switch (ch) {
        case '1': return {0, 2};
        case '2': return {1, 1};
        case '3': return {1, -1};
        case '4': return {0, -2};
        case '5': return {-1, -1};
        case '6': return {-1, 1};
        default:  return {0, 0};
    }
}

void solve_board() {
    int R, H, W;
    if (!(cin >> R >> H >> W)) return;

    vector<string> grid(H);
    for (int r = 0; r < H; ++r) {
        cin >> grid[r];
    }

    // Find emitter(s) and trace laser
    for (int r = 0; r < H; ++r) {
        for (int c = 0; c < W; ++c) {
            char ch = grid[r][c];
            if (ch >= '1' && ch <= '6') {
                Delta d = get_delta(ch);
                int cr = r + d.dr;
                int cc = c + d.dc;
                while (cr >= 0 && cr < H && cc >= 0 && cc < W) {
                    if (grid[cr][cc] == '*' || (grid[cr][cc] >= '1' && grid[cr][cc] <= '6')) {
                        break;
                    }
                    if (grid[cr][cc] == 'O') {
                        grid[cr][cc] = 'M';
                    }
                    cr += d.dr;
                    cc += d.dc;
                }
            }
        }
    }

    for (int r = 0; r < H; ++r) {
        cout << grid[r] << "\n";
    }
    cout << "\n";
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);

    int N;
    if (cin >> N) {
        while (N--) {
            solve_board();
        }
    }
    return 0;
}
