bool searchInMatrix(
    String searchWord, int m, int n, List<List<String>> matrix) {
  // Check horizontal
  for (int i = 0; i < m; i++) {
    for (int j = 0; j <= n - searchWord.length; j++) {
      for (int k = 0; k < searchWord.length; k++) {
        if (matrix[i][j + k] == searchWord[k]) {
          print("Found horizontally starting at $k");
          break;
        }
      }
    }
  }

  // Check vertical
  for (int i = 0; i <= m - searchWord.length; i++) {
    for (int j = 0; j < n; j++) {
      bool found = true;
      for (int k = 0; k < searchWord.length; k++) {
        if (matrix[i + k][j] != searchWord[k]) {
          found = false;
          break;
        }
      }
      if (found) {
        print("Found vertically starting at (${i + 1}, ${j + 1})");
        return true;
      }
    }
  }

  // Check right-to-left diagonal
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (i + searchWord.length <= m && j + searchWord.length <= n) {
        bool found = true;
        for (int k = 0; k < searchWord.length; k++) {
          if (matrix[i + k][j + k] != searchWord[k]) {
            found = false;
            break;
          }
        }
        if (found) {
          print(
              "Found at right-to-left diagonal starting at (${i + 1}, ${j + 1})");
          return true;
        }
      }
    }
  }

  // Check left-to-right diagonal
  for (int i = 0; i < m; i++) {
    for (int j = n - 1; j >= 0; j--) {
      if (i + searchWord.length <= m && j - searchWord.length + 1 >= 0) {
        bool found = true;
        for (int k = 0; k < searchWord.length; k++) {
          if (matrix[i + k][j - k] != searchWord[k]) {
            found = false;
            break;
          }
        }
        if (found) {
          print(
              "Found at left-to-right diagonal starting at (${i + 1}, ${j + 1})");
          return true;
        }
      }
    }
  }

  print("Search word not found in any direction.");
  return false;
}
