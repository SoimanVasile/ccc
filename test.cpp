#include <iostream>
#include <string>
#include <vector>
#include <cmath>

using namespace std;

void print_board(int R) {
    for (int i = 0; i <= 2 * R; ++i) {
        int d = std::abs(R - i);
        string line;
        line.append(d, '-');

        if (d == R) {
            line.push_back('*');
            for (int s = 0; s < R; ++s) {
                line.push_back('-');
                line.push_back('*');
            }
        } else {
            int o_count = 2 * R - 1 - d;
            line.push_back('*');
            for (int o = 0; o < o_count; ++o) {
                line.push_back('-');
                line.push_back('O');
            }
            line.push_back('-');
            line.push_back('*');
        }

        line.append(d, '-');
        cout << line << "\n";
    }
    cout << "\n";
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);

    int N;
    if (!(cin >> N)) return 0;
    for (int i = 0; i < N; ++i) {
        int nrx, nry;
        int R, rows, cols;
        cin >> R >> rows >> cols;
        vector<string> img;
        img.reserve(rows);
        for(int j{0}; j < rows; j++){
            getline(std::cin, img[j]);
            for (int k{0}; k < img[j].size(); k++){
                auto c = img[j][k];
                if (c >= '0' && c <= '9'){
                    nrx = k;
                    nry = j;
                }
            }
        }

        switch (img[nry][nrx]){
            case '1': {
                          for (int k{0}; )
                      }
        }
    }
    return 0;
}
